#!/usr/bin/perl
package login;

my( $elem, $tocateg, $new_cat, );

###DB-LOGIN-DATA
my ( $db_user, $db_pass, $db_name ) = ("root", "t00rt00r", "CONFIGURATORCMS");

my ( $table ) = ( "login" );
#SQL-QUERIES AS VARs

my $ins_credentials = "INSERT INTO " . $table . " (user, pw) VALUES (?, ?);";
# this query select id from assigned categorie ( which is to an simple element ) and the column cat gonna be use to check is it zero, cause just then it can be used as a category for other elements
my $check_credentials = "SELECT id FROM login WHERE user = ? AND pw = ?;";
my $set_random = "UPDATE login SET sess_act = ?, rand_date = ? ;";

####ACCESSORS
our $accIns_el = sub {
                # make plausibility check with sprintf ...
                my ( $ref, $sql ) = ( shift, shift );
                $ins_post = $sql if $sql ne "";
                $ins_post;
};


####CONSTRUCTOR### 
sub new { 
	my $type = shift;
    my $self = {};       
	bless $self, $type;
    $self;
}


sub printres {
	my $self = shift;
	my $args = shift;
	
	my $cgi = CGI->new;
	
	$user = $cgi->param('user');
	$pw = $cgi->param('pw');
	$id = $cgi->param('id');
		
	print "Content-type: text/json\n\n";
	
	my $inst = db_manager->new("CONFIGURATORCMS", "root", "t00rt00r");
	
	$dbh = $inst->con( $inst->{"db_name"}, $inst->{"user"}, $inst->{"pw"} );
		
	my $resp = $self -> sel_query( $dbh, $check_credentials, [ $user, $pw ]);
	
	#TEST
	@listOfList = ( [$user], [$pw], [$resp] );
	print JSON->new->utf8->encode(\@listOfList);
}

1;
