#!/usr/bin/perl
package price;
#use strict;
use Data::Dumper;
#use lib '/var/www/cgi-bin/CONFIGURATORCMS';
use modules;

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

####DB-METHODS###
sub printres {
	my $self = shift;
	my $args = shift;
	
	print "Content-type: text/json\n\n";
	
	$res_set = $DB_DATA::inst->sel_query( $DB_DATA::dbh, $DB_DATA::price, [] );
	
	#SAME AS : print Dumper $res_set;
	print JSON->new->utf8->encode(\@{$res_set});

}

1;
