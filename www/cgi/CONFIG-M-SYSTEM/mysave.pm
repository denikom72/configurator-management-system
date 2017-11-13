#!/usr/bin/perl
package mysave;
#use strict;
my( $elem, $tocateg, $new_cat );

####ACCESSORS
our $accIns_el = sub {
                # make plausibility check with sprintf ...
                my ( $ref, $sql ) = ( shift, shift );
                $ins_post = $sql if $sql ne "";
                $ins_post;
};


####END###

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
	
	$elem = $cgi->param('elem');
	$tocateg = $cgi->param('tocateg');
	$new_cat = $cgi->param('newcat');
	$single_price = $cgi->param('singleproductPrice');
	
		
	print "Content-type: text/json\n\n";
	
	
	if( $elem ne "" && $tocateg ne "" && $single_price ne "" ){
		my $res_elem_id = $DB_DATA::inst->sel_query( $DB_DATA::dbh, $DB_DATA::elem_id, [ $tocateg ]);
		my $res_cat_id = $DB_DATA::inst->sel_query( $DB_DATA::dbh, $DB_DATA::categ_id, [ $tocateg ]);
		
		#ADD AS CATEG IF CATEG-ID IS 0, MEANS IS ON THE TOP ( HAS NO PARENT-CATEGS ), I AVOID SUBCATEGS AND 		
		$DB_DATA::inst->db_crud( $DB_DATA::dbh, $DB_DATA::ins_el, [$elem, $res_elem_id->[0]->[0], $single_price] ) if $res_cat_id->[0]->[0] == 0;
	}
	
	if( $new_cat ne ""  ){
		#print "NEWCAT: ".$new_cat;
		$DB_DATA::inst->db_crud( $DB_DATA::dbh, $DB_DATA::ins_el, [$new_cat, 0, 0] );
	}
}

1;
