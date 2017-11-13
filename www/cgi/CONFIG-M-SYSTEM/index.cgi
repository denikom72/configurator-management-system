#!/usr/bin/perl -w
use lib "/var/www/cgi-bin/CONFIGURATORCMS/";
use CGI;
use DB_DATA;

my $cgi = new CGI;

my $SESSION = 0;

$RANDOM_DATE = $cgi->param("rand_date") ? $cgi->param("rand_date") : "PLACEHOLDER";

### SEND QUERY ###

my $rand = $DB_DATA::inst->sel_query( $DB_DATA::dbh, $DB_DATA::sql_sess, [1] );

if ( defined $rand->[0][0] && $rand->[0][0] =~ /$RANDOM_DATE/ && defined $rand->[0][1] &&  $rand->[0][1] == 1 ) {
	$SESSION = 1;
}

# INCLUDE STATIC HTML-FRAGMENTS
require header;	
require loginForm if $SESSION != 1;
require ngNameSpace;

require ConfManagSys if $SESSION == 1;

#configurator-output
require resSetTable;

require ngNameSpaceEnd;

#javascript
require footerJs;

# END OF HTML
print "<pre>";
print "</pre>";
print "</body></html>";
