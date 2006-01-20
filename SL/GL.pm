#=====================================================================
# SQL-Ledger Accounting
# Copyright (C) 2000
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
# General ledger backend code
#
#======================================================================

package GL;


sub delete_transaction {
  my ($self, $myconfig, $form) = @_;
  
  # connect to database
  my $dbh = $form->dbconnect_noauto($myconfig);
  
  my %audittrail = ( tablename  => 'gl',
                     reference  => $form->{reference},
		     formname   => 'transaction',
		     action     => 'deleted',
		     id         => $form->{id} );
 
  $form->audittrail($dbh, "", \%audittrail);

  my $query = qq|DELETE FROM gl WHERE id = $form->{id}|;
  $dbh->do($query) || $form->dberror($query);

  $query = qq|DELETE FROM acc_trans WHERE trans_id = $form->{id}|;
  $dbh->do($query) || $form->dberror($query);

  # commit and redirect
  my $rc = $dbh->commit;
  $dbh->disconnect;
  
  $rc;
  
}


sub post_transaction {
  my ($self, $myconfig, $form) = @_;
  
  my $null;
  my $project_id;
  my $department_id;
  my $i;

  # connect to database, turn off AutoCommit
  my $dbh = $form->dbconnect_noauto($myconfig);

  my $query;
  my $sth;

  if ($form->{id}) {
    $query = qq|SELECT id FROM gl WHERE id = $form->{id}|;
    ($form->{id}) = $dbh->selectrow_array($query);

    if ($form->{id}) {
      # delete individual transactions
      $query = qq|DELETE FROM acc_trans 
		  WHERE trans_id = $form->{id}|;
      $dbh->do($query) || $form->dberror($query);
    }
  }
  
  if (! $form->{id}) {
   
    my $uid = time;
    $uid .= $$;

    $query = qq|INSERT INTO gl (reference, employee_id)
                VALUES ('$uid', (SELECT id FROM employee
		                 WHERE login = '$form->{login}'))|;
    $dbh->do($query) || $form->dberror($query);
    
    $query = qq|SELECT id FROM gl
                WHERE reference = '$uid'|;
    ($form->{id}) = $dbh->selectrow_array($query);
  }
  
  ($null, $department_id) = split /--/, $form->{department};
  $department_id *= 1;

  $form->{reference} = $form->update_defaults($myconfig, 'glnumber', $dbh) unless $form->{reference};
  $form->{reference} ||= $form->{id};
  
  $query = qq|UPDATE gl SET 
	      reference = |.$dbh->quote($form->{reference}).qq|,
	      description = |.$dbh->quote($form->{description}).qq|,
	      notes = |.$dbh->quote($form->{notes}).qq|,
	      transdate = '$form->{transdate}',
	      department_id = $department_id
	      WHERE id = $form->{id}|;
	   
  $dbh->do($query) || $form->dberror($query);


  my $amount = 0;
  my $posted = 0;
  my $debit;
  my $credit;
  
  # insert acc_trans transactions
  for $i (1 .. $form->{rowcount}) {

    $debit = $form->parse_amount($myconfig, $form->{"debit_$i"});
    $credit = $form->parse_amount($myconfig, $form->{"credit_$i"});

    # extract accno
    ($accno) = split(/--/, $form->{"accno_$i"});
    
    if ($credit) {
      $amount = $credit;
      $posted = 0;
    }
    if ($debit) {
      $amount = $debit * -1;
      $posted = 0;
    }

    # add the record
    if (! $posted) {
      
      ($null, $project_id) = split /--/, $form->{"projectnumber_$i"};
      $project_id ||= 'NULL';
      $form->{"fx_transaction_$i"} *= 1;
      
      $query = qq|INSERT INTO acc_trans (trans_id, chart_id, amount, transdate,
		  source, project_id, fx_transaction, memo)
		  VALUES
		  ($form->{id}, (SELECT id
				 FROM chart
				 WHERE accno = '$accno'),
		   $amount, '$form->{transdate}', |.
		   $dbh->quote($form->{"source_$i"}) .qq|,
		  $project_id, '$form->{"fx_transaction_$i"}', |.
		  $dbh->quote($form->{"memo_$i"}).qq|)|;
    
      $dbh->do($query) || $form->dberror($query);

      $posted = 1;
    }

  }
  
  my %audittrail = ( tablename  => 'gl',
                     reference  => $form->{reference},
		     formname   => 'transaction',
		     action     => 'posted',
		     id         => $form->{id} );
 
  $form->audittrail($dbh, "", \%audittrail);

  $form->save_recurring($dbh, $myconfig);

  # commit and redirect
  my $rc = $dbh->commit;
  $dbh->disconnect;

  $rc;

}



sub all_transactions {
  my ($self, $myconfig, $form) = @_;

  # connect to database
  my $dbh = $form->dbconnect($myconfig);
  my $query;
  my $sth;
  my $var;
  my $null;

  my ($glwhere, $arwhere, $apwhere) = ("1 = 1", "1 = 1", "1 = 1");
  
  if ($form->{reference} ne "") {
    $var = $form->like(lc $form->{reference});
    $glwhere .= " AND lower(g.reference) LIKE '$var'";
    $arwhere .= " AND lower(a.invnumber) LIKE '$var'";
    $apwhere .= " AND lower(a.invnumber) LIKE '$var'";
  }
  if ($form->{department} ne "") {
    ($null, $var) = split /--/, $form->{department};
    $glwhere .= " AND g.department_id = $var";
    $arwhere .= " AND a.department_id = $var";
    $apwhere .= " AND a.department_id = $var";
  }

  if ($form->{source} ne "") {
    $var = $form->like(lc $form->{source});
    $glwhere .= " AND lower(ac.source) LIKE '$var'";
    $arwhere .= " AND lower(ac.source) LIKE '$var'";
    $apwhere .= " AND lower(ac.source) LIKE '$var'";
  }
  
  if ($form->{memo} ne "") {
    $var = $form->like(lc $form->{memo});
    $glwhere .= " AND lower(ac.memo) LIKE '$var'";
    $arwhere .= " AND lower(ac.memo) LIKE '$var'";
    $apwhere .= " AND lower(ac.memo) LIKE '$var'";
  }

  ($form->{datefrom}, $form->{dateto}) = $form->from_to($form->{year}, $form->{month}, $form->{interval}) if $form->{year} && $form->{month};
  
  if ($form->{datefrom}) {
    $glwhere .= " AND ac.transdate >= '$form->{datefrom}'";
    $arwhere .= " AND ac.transdate >= '$form->{datefrom}'";
    $apwhere .= " AND ac.transdate >= '$form->{datefrom}'";
  }
  if ($form->{dateto}) {
    $glwhere .= " AND ac.transdate <= '$form->{dateto}'";
    $arwhere .= " AND ac.transdate <= '$form->{dateto}'";
    $apwhere .= " AND ac.transdate <= '$form->{dateto}'";
  }
  if ($form->{amountfrom}) {
    $glwhere .= " AND abs(ac.amount) >= $form->{amountfrom}";
    $arwhere .= " AND abs(ac.amount) >= $form->{amountfrom}";
    $apwhere .= " AND abs(ac.amount) >= $form->{amountfrom}";
  }
  if ($form->{amountto}) {
    $glwhere .= " AND abs(ac.amount) <= $form->{amountto}";
    $arwhere .= " AND abs(ac.amount) <= $form->{amountto}";
    $apwhere .= " AND abs(ac.amount) <= $form->{amountto}";
  }
  if ($form->{description}) {
    $var = $form->like(lc $form->{description});
    $glwhere .= " AND lower(g.description) LIKE '$var'";
    $arwhere .= " AND (lower(ct.name) LIKE '$var'
                       OR lower(ac.memo) LIKE '$var'
                       OR a.id IN (SELECT DISTINCT trans_id
		                   FROM invoice
			           WHERE lower(description) LIKE '$var'))";
    $apwhere .= " AND (lower(ct.name) LIKE '$var'
                       OR lower(ac.memo) LIKE '$var'
                       OR a.id IN (SELECT DISTINCT trans_id
		               FROM invoice
			       WHERE lower(description) LIKE '$var'))";
  }
  if ($form->{notes}) {
    $var = $form->like(lc $form->{notes});
    $glwhere .= " AND lower(g.notes) LIKE '$var'";
    $arwhere .= " AND lower(a.notes) LIKE '$var'";
    $apwhere .= " AND lower(a.notes) LIKE '$var'";
  }
  if ($form->{accno}) {
    $glwhere .= " AND c.accno = '$form->{accno}'";
    $arwhere .= " AND c.accno = '$form->{accno}'";
    $apwhere .= " AND c.accno = '$form->{accno}'";
  }
  if ($form->{gifi_accno}) {
    $glwhere .= " AND c.gifi_accno = '$form->{gifi_accno}'";
    $arwhere .= " AND c.gifi_accno = '$form->{gifi_accno}'";
    $apwhere .= " AND c.gifi_accno = '$form->{gifi_accno}'";
  }
  if ($form->{category} ne 'X') {
    $glwhere .= " AND c.category = '$form->{category}'";
    $arwhere .= " AND c.category = '$form->{category}'";
    $apwhere .= " AND c.category = '$form->{category}'";
  }

  if ($form->{accno}) {
    # get category for account
    $query = qq|SELECT category, link, contra, description
                FROM chart
		WHERE accno = '$form->{accno}'|;
    ($form->{category}, $form->{link}, $form->{contra}, $form->{account_description}) = $dbh->selectrow_array($query); 
    
    if ($form->{datefrom}) {
      $query = qq|SELECT SUM(ac.amount)
		  FROM acc_trans ac
		  JOIN chart c ON (ac.chart_id = c.id)
		  WHERE c.accno = '$form->{accno}'
		  AND ac.transdate < date '$form->{datefrom}'
		  |;
      ($form->{balance}) = $dbh->selectrow_array($query);
    }
  }
  
  if ($form->{gifi_accno}) {
    # get category for account
    $query = qq|SELECT c.category, c.link, c.contra, g.description
                FROM chart c
		LEFT JOIN gifi g ON (g.accno = c.gifi_accno)
		WHERE c.gifi_accno = '$form->{gifi_accno}'|;
    ($form->{category}, $form->{link}, $form->{contra}, $form->{gifi_account_description}) = $dbh->selectrow_array($query); 
   
    if ($form->{datefrom}) {
      $query = qq|SELECT SUM(ac.amount)
		  FROM acc_trans ac
		  JOIN chart c ON (ac.chart_id = c.id)
		  WHERE c.gifi_accno = '$form->{gifi_accno}'
		  AND ac.transdate < date '$form->{datefrom}'
		  |;
      ($form->{balance}) = $dbh->selectrow_array($query);
    }
  }

  my $false = ($myconfig->{dbdriver} =~ /Pg/) ? FALSE : q|'0'|;

  my %ordinal = ( id => 1,
                  reference => 4,
		  description => 5,
                  transdate => 6,
                  source => 7,
                  accno => 9,
		  department => 15,
		  memo => 16 );
  
  my @a = (id, transdate, reference, source, description, accno);
  my $sortorder = $form->sort_order(\@a, \%ordinal);
  
  my $query = qq|SELECT g.id, 'gl' AS type, $false AS invoice, g.reference,
                 g.description, ac.transdate, ac.source,
		 ac.amount, c.accno, c.gifi_accno, g.notes, c.link,
		 '' AS till, ac.cleared, d.description AS department,
		 ac.memo
                 FROM gl g
		 JOIN acc_trans ac ON (g.id = ac.trans_id)
		 JOIN chart c ON (ac.chart_id = c.id)
		 LEFT JOIN department d ON (d.id = g.department_id)
                 WHERE $glwhere
	UNION ALL
	         SELECT a.id, 'ar' AS type, a.invoice, a.invnumber,
		 ct.name, ac.transdate, ac.source,
		 ac.amount, c.accno, c.gifi_accno, a.notes, c.link,
		 a.till, ac.cleared, d.description AS department,
		 ac.memo
		 FROM ar a
		 JOIN acc_trans ac ON (a.id = ac.trans_id)
		 JOIN chart c ON (ac.chart_id = c.id)
		 JOIN customer ct ON (a.customer_id = ct.id)
		 LEFT JOIN department d ON (d.id = a.department_id)
		 WHERE $arwhere
	UNION ALL
	         SELECT a.id, 'ap' AS type, a.invoice, a.invnumber,
		 ct.name, ac.transdate, ac.source,
		 ac.amount, c.accno, c.gifi_accno, a.notes, c.link,
		 a.till, ac.cleared, d.description AS department,
		 ac.memo
		 FROM ap a
		 JOIN acc_trans ac ON (a.id = ac.trans_id)
		 JOIN chart c ON (ac.chart_id = c.id)
		 JOIN vendor ct ON (a.vendor_id = ct.id)
		 LEFT JOIN department d ON (d.id = a.department_id)
		 WHERE $apwhere
	         ORDER BY $sortorder|;
  my $sth = $dbh->prepare($query);
  $sth->execute || $form->dberror($query);

  
  while (my $ref = $sth->fetchrow_hashref(NAME_lc)) {

    # gl
    if ($ref->{type} eq "gl") {
      $ref->{module} = "gl";
    }

    # ap
    if ($ref->{type} eq "ap") {
      if ($ref->{invoice}) {
        $ref->{module} = "ir";
      } else {
        $ref->{module} = "ap";
      }
    }

    # ar
    if ($ref->{type} eq "ar") {
      if ($ref->{invoice}) {
        $ref->{module} = ($ref->{till}) ? "ps" : "is";
      } else {
        $ref->{module} = "ar";
      }
    }

    if ($ref->{amount} < 0) {
      $ref->{debit} = $ref->{amount} * -1;
      $ref->{credit} = 0;
    } else {
      $ref->{credit} = $ref->{amount};
      $ref->{debit} = 0;
    }

    push @{ $form->{GL} }, $ref;
    
  }

  $sth->finish;
  $dbh->disconnect;

}


sub transaction {
  my ($self, $myconfig, $form) = @_;
  
  my ($query, $sth, $ref);
  
  # connect to database
  my $dbh = $form->dbconnect($myconfig);

  if ($form->{id}) {
    $query = "SELECT closedto, revtrans
              FROM defaults";
    $sth = $dbh->prepare($query);
    $sth->execute || $form->dberror($query);

    ($form->{closedto}, $form->{revtrans}) = $sth->fetchrow_array;
    $sth->finish;

    $query = qq|SELECT g.*,
                d.description AS department
                FROM gl g
	        LEFT JOIN department d ON (d.id = g.department_id)  
	        WHERE g.id = $form->{id}|;
    $sth = $dbh->prepare($query);
    $sth->execute || $form->dberror($query);

    $ref = $sth->fetchrow_hashref(NAME_lc);
    for (keys %$ref) { $form->{$_} = $ref->{$_} }
    $sth->finish;
  
    # retrieve individual rows
    $query = qq|SELECT ac.*, c.accno, c.description, p.projectnumber
	        FROM acc_trans ac
	        JOIN chart c ON (ac.chart_id = c.id)
	        LEFT JOIN project p ON (p.id = ac.project_id)
	        WHERE ac.trans_id = $form->{id}
	        ORDER BY accno|;
    $sth = $dbh->prepare($query);
    $sth->execute || $form->dberror($query);
    
    while ($ref = $sth->fetchrow_hashref(NAME_lc)) {
      if ($ref->{fx_transaction}) {
	$form->{transfer} = 1;
      }
      push @{ $form->{GL} }, $ref;
    }

    # get recurring transaction
    $form->get_recurring($dbh);
      
  } else {
    $query = "SELECT current_date AS transdate, closedto, revtrans
              FROM defaults";
    $sth = $dbh->prepare($query);
    $sth->execute || $form->dberror($query);

    ($form->{transdate}, $form->{closedto}, $form->{revtrans}) = $sth->fetchrow_array;
  }

  $sth->finish;

  my $paid;
  if ($form->{transfer}) {
    $paid = qq|AND link LIKE '%_paid%'
	     
	  UNION
	  
	       SELECT accno,description
	       FROM chart
	       WHERE id IN (SELECT fxgain_accno_id FROM defaults)
	       OR id IN (SELECT fxloss_accno_id FROM defaults)|;
  }
  
  # get chart of accounts
  $query = qq|SELECT accno,description
              FROM chart
	      WHERE charttype = 'A'
	      $paid
              ORDER by accno|;
  $sth = $dbh->prepare($query);
  $sth->execute || $form->dberror($query);
  
  while ($ref = $sth->fetchrow_hashref(NAME_lc)) {
    push @{ $form->{all_accno} }, $ref;
  }
  $sth->finish;

  # get departments
  $form->all_departments($myconfig, $dbh);
  
  # get projects
  $form->all_projects($myconfig, $dbh, $form->{transdate});
  
  $dbh->disconnect;

}


1;
