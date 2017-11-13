#!/usr/bin/perl
package mydelete;
use strict;
use Data::Dumper;

my( $elem, $tocateg, $new_cat, );
####ACCESSORS
our $accIns_el = sub {
                # make plausibility check with sprintf ...
                my ( $ref, $sql ) = ( shift, shift );
                my $ins_post = $sql if $sql ne "";
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
	
	my( $self, $argv ) = ( shift, shift );
	print "Content-type: text/json\n\n";

	my $cgi = CGI->new;

	my $elem = $cgi->param('elem');
	my $tocateg = $cgi->param('tocateg');
	my $new_cat = $cgi->param('newcat');
	
	if( $elem ne "" && $tocateg ne "" ){
		my $res_elem_id = $DB_DATA::inst->sel_query( $DB_DATA::dbh, $DB_DATA::elem_id, [ $tocateg ]);
		my $res_cat_id = $DB_DATA::inst->sel_query( $DB_DATA::dbh, $DB_DATA::categ_id, [ $tocateg ]);
		
		$DB_DATA::inst->db_crud( $DB_DATA::dbh, $DB_DATA::del_el, [ $elem ] ) if $res_cat_id->[0]->[0] == 0;
	}

}

1;
