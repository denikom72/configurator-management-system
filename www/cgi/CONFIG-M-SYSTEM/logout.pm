#!/usr/bin/perl
package logout;
#use strict;
use Data::Dumper;

my( $elem, $tocateg, $new_cat, );

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
	
	my( $self, $argv ) = ( shift, shift );
	print "Content-type: text/json\n\n";
	$DB_DATA::inst->db_crud( $DB_DATA::dbh, $DB_DATA::upd_logout, [] );
}

1;
