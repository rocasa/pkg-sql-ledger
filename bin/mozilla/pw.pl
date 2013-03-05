#=====================================================================
# SQL-Ledger Accounting
# Copyright (c) 2004
#
#  Author: DWS Systems Inc.
#     Web: http://www.sql-ledger.org
#
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


1;
# end of main


sub getpassword {
  my ($s) = @_;

  $form->{endsession} = 1;
  $form->header;

  $sessionexpired = qq|<b><font color=red><blink>|.$locale->text('Session expired!').qq|</blink></font></b><p>| if $s;
  
  print qq|
<script language="JavaScript" type="text/javascript">
<!--
function sf(){
    document.pw.password.focus();
}
// End -->
</script>

<body onload="sf()">

  $sessionexpired

<form method=post action=$form->{script} name=pw>

<table>
  <tr>
    <th align=right>|.$locale->text('Password').qq|</th>
    <td><input type=password name=password size=30></td>
    <td><input type=submit value="|.$locale->text('Continue').qq|"></td>
  </tr>
</table>

|;

  for (qw(script endsession password)) { delete $form->{$_} }
  $form->hide_form;
  
  print qq|
</form>

</body>
</html>
|;

}


