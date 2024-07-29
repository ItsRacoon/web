#! /usr/bin/perl
print "Content-type: text/html\n\n";
print "<HTML><HEAD><TITLE>Result of the insert operation 
</TITLE></HEAD>";
use CGI ':standard';
use DBI;
$dbh=DBI->connect("DBI:mysql:muz","apache","cool");
$name=param("name");
$age=param("age");
$qh=$dbh->prepare("insert into stud values('$name','$age')");
$qh->execute();
$qh=$dbh->prepare("Select * from stud");
$qh->execute();
print "<table border size=1><tr><th>Name</th><th>Age</th></tr>";
while ( ($name,$age)=$qh->fetchrow())
{ 
 print "<tr><td>$name</td><td>$age</td></tr>";
Web Development Lab [22ISL473]
Dept. of ISE,DSCE
}
print "</table>";
$qh->finish();
$dbh->disconnect();
print"</HTML>";
