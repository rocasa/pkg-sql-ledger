#=====================================================================
# SQL-Ledger Accounting
# Copyright (C) 2001
#
#  Author: DWS Systems Inc.
#     Web: http://www.sql-ledger.org
#
#  Contributors:
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
#======================================================================
#
# chart of accounts
#
#======================================================================


package CA;


sub all_accounts {
  my ($self, $myconfig, $form) = @_;

  my $amount = ();
  # connect to database
  my $dbh = $form->dbconnect($myconfig);

  my $query = qq|SELECT accno,
                 SUM(acc_trans.amount) AS amount
                 FROM chart, acc_trans
		 WHERE chart.id = acc_trans.chart_id
		 GROUP BY accno|;
  my $sth = $dbh->prepare($query);
  $sth->execute || $form->dberror($query);

  while (my $ref = $sth->fetchrow_hashref(NAME_lc)) {
    $amount{$ref->{accno}} = $ref->{amount}
  }
  $sth->finish;
 
  $query = qq|SELECT accno, description
              FROM gifi|;
  $sth = $dbh->prepare($query);
  $sth->execute || $form->dberror($query);

  my $gifi = ();
  while (my ($accno, $description) = $sth->fetchrow_array) {
    $gifi{$accno} = $description;
  }
  $sth->finish;

  $query = qq|SELECT c.id, c.accno, c.description, c.charttype, c.gifi_accno,
              c.category, c.link
              FROM chart c
	      ORDER BY accno|;
  $sth = $dbh->prepare($query);
  $sth->execute || $form->dberror($query);
 
  while (my $ca = $sth->fetchrow_hashref(NAME_lc)) {
    $ca->{amount} = $amount{$ca->{accno}};
    $ca->{gifi_description} = $gifi{$ca->{gifi_accno}};
    if ($ca->{amount} < 0) {
      $ca->{debit} = $ca->{amount} * -1;
    } else {
      $ca->{credit} = $ca->{amount};
    }
    push @{ $form->{CA} }, $ca;
  }

  $sth->finish;
  $dbh->disconnect;

}


sub all_transactions {
  my ($self, $myconfig, $form) = @_;

  # connect to database
  my $dbh = $form->dbconnect($myconfig);

  # get chart_id
  my $query = qq|SELECT id FROM chart
                 WHERE accno = '$form->{accno}'|;
  if ($form->{accounttype} eq 'gifi') {
    $query = qq|SELECT id FROM chart
                WHERE gifi_accno = '$form->{gifi_accno}'|;
  }
  my $sth = $dbh->prepare($query);
  $sth->execute || $form->dberror($query);

  my @id = ();
  while (my ($id) = $sth->fetchrow_array) {
    push @id, $id;
  }
  $sth->finish;

  my $fromdate_where;
  my $todate_where;

  ($form->{fromdate}, $form->{todate}) = $form->from_to($form->{year}, $form->{month}, $form->{interval}) if $form->{year} && $form->{month};
  
  if ($form->{fromdate}) {
    $fromdate_where = qq|
                 AND ac.transdate >= '$form->{fromdate}'
		|;
  }
  if ($form->{todate}) {
    $todate_where .= qq|
                 AND ac.transdate <= '$form->{todate}'
		|;
  }
  

  my $false = ($myconfig->{dbdriver} =~ /Pg/) ? FALSE : q|'0'|;
  
  # Oracle workaround, use ordinal positions
  my %ordinal = ( transdate => 4,
		  reference => 2,
		  description => 3 );

  my @a = qw(transdate reference description);
  my $sortorder = $form->sort_order(\@a, \%ordinal);

  my $null;
  my $department_id;
  my $dpt_where;
  my $dpt_join;
  
  ($null, $department_id) = split /--/, $form->{department};
  
  if ($department_id) {
    $dpt_join = qq|
                   JOIN department t ON (t.id = a.department_id)
		  |;
    $dpt_where = qq|
		   AND t.id = $department_id
		  |;
  }

  my $project;
  my $project_id;
  if ($form->{projectnumber}) {
    ($null, $project_id) = split /--/, $form->{projectnumber};
    $project = qq|
                 AND ac.project_id = $project_id
		 |;
  }

  if ($form->{accno} || $form->{gifi_accno}) {
    # get category for account
    $query = qq|SELECT description, category, link, contra
                FROM chart
		WHERE accno = '$form->{accno}'|;

    if ($form->{accounttype} eq 'gifi') {
      $query = qq|SELECT description, category, link, contra
                FROM chart
		WHERE gifi_accno = '$form->{gifi_accno}'
		AND charttype = 'A'|;
    }

    ($form->{description}, $form->{category}, $form->{link}, $form->{contra}) = $dbh->selectrow_array($query);
    
    if ($form->{fromdate}) {

      # get beginning balance
      $query = qq|SELECT SUM(ac.amount)
		  FROM acc_trans ac
		  JOIN chart c ON (ac.chart_id = c.id)
		  $dpt_join
		  WHERE c.accno = '$form->{accno}'
		  AND ac.transdate < '$form->{fromdate}'
		  $dpt_where
		  $project
		  |;

      if ($form->{accounttype} eq 'gifi') {
        $query = qq|SELECT SUM(ac.amount)
		  FROM acc_trans ac
		  JOIN chart c ON (ac.chart_id = c.id)
		  $dpt_join
		  WHERE c.gifi_accno = '$form->{gifi_accno}'
		  AND ac.transdate < '$form->{fromdate}'
		  $dpt_where
		  $project
		  |;
		  
      }
      
      ($form->{balance}) = $dbh->selectrow_array($query);
      
    }
  }

  $query = "";
  my $union = "";

  foreach my $id (@id) {
    
    # get all transactions
    $query .= qq|$union
                 SELECT a.id, a.reference, a.description, ac.transdate,
	         $false AS invoice, ac.amount, 'gl' as module, ac.cleared,
		 '' AS till, ac.chart_id
		 FROM gl a
		 JOIN acc_trans ac ON (ac.trans_id = a.id)
		 $dpt_join
		 WHERE ac.chart_id = $id
		 $fromdate_where
		 $todate_where
		 $dpt_where
		 $project
      
             UNION ALL
      
                 SELECT a.id, a.invnumber, c.name, ac.transdate,
	         a.invoice, ac.amount, 'ar' as module, ac.cleared,
		 a.till, ac.chart_id
		 FROM ar a
		 JOIN acc_trans ac ON (ac.trans_id = a.id)
		 JOIN customer c ON (a.customer_id = c.id)
		 $dpt_join
		 WHERE ac.chart_id = $id
		 $fromdate_where
		 $todate_where
		 $dpt_where
		 $project
      
             UNION ALL
      
                 SELECT a.id, a.invnumber, v.name, ac.transdate,
	         a.invoice, ac.amount, 'ap' as module, ac.cleared,
		 a.till, ac.chart_id
		 FROM ap a
		 JOIN acc_trans ac ON (ac.trans_id = a.id)
		 JOIN vendor v ON (a.vendor_id = v.id)
		 $dpt_join
		 WHERE ac.chart_id = $id
		 $fromdate_where
		 $todate_where
		 $dpt_where
		 $project
		 |;

    $union = qq|
             UNION ALL
                 |;
  }

  $query .= qq|
      ORDER BY $sortorder|;

  $sth = $dbh->prepare($query);
  $sth->execute || $form->dberror($query);

  $query = qq|SELECT c.id, c.accno FROM chart c
              JOIN acc_trans ac ON (ac.chart_id = c.id)
              WHERE ac.amount >= 0
	      AND (c.link = 'AR' OR c.link = 'AP')
	      AND ac.trans_id = ?|;
  my $dr = $dbh->prepare($query) || $form->dberror($query);
  
  $query = qq|SELECT c.id, c.accno FROM chart c
              JOIN acc_trans ac ON (ac.chart_id = c.id)
              WHERE ac.amount < 0
	      AND (c.link = 'AR' OR c.link = 'AP')
	      AND ac.trans_id = ?|;
  my $cr = $dbh->prepare($query) || $form->dberror($query);
  
  my $accno;
  my $chart_id;
  my %accno;
  
  while (my $ca = $sth->fetchrow_hashref(NAME_lc)) {
    
    # gl
    if ($ca->{module} eq "gl") {
      $ca->{module} = "gl";
    }

    # ap
    if ($ca->{module} eq "ap") {
      $ca->{module} = ($ca->{invoice}) ? 'ir' : 'ap';
      $ca->{module} = 'ps' if $ca->{till};
    }

    # ar
    if ($ca->{module} eq "ar") {
      $ca->{module} = ($ca->{invoice}) ? 'is' : 'ar';
      $ca->{module} = 'ps' if $ca->{till};
    }

    if ($ca->{amount}) {
      %accno = ();

      if ($ca->{amount} < 0) {
	$ca->{debit} = $ca->{amount} * -1;
	$ca->{credit} = 0;
	$dr->execute($ca->{id});
	$ca->{accno} = ();
	while (($chart_id, $accno) = $dr->fetchrow_array) {
	  $accno{$accno} = 1 if $chart_id ne $ca->{chart_id};
	}
	$dr->finish;
	
	for (sort keys %accno) { push @{ $ca->{accno} }, "$_ " }

      } else {
	$ca->{credit} = $ca->{amount};
	$ca->{debit} = 0;
	
	$cr->execute($ca->{id});
	$ca->{accno} = ();
	while (($chart_id, $accno) = $cr->fetchrow_array) {
	  $accno{$accno} = 1 if $chart_id ne $ca->{chart_id};
	}
	$cr->finish;

	for (keys %accno) { push @{ $ca->{accno} }, "$_ " }

      }

      push @{ $form->{CA} }, $ca;
    }
    
  }
 
  $sth->finish;
  $dbh->disconnect;

}

1;
