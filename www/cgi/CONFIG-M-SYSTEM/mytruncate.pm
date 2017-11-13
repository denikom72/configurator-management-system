#!/usr/bin/perl
package mytruncate;
#use strict;
 
####ACCESSORS


our $accins_price = sub {
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
	
	my $inst = db_manager->new("CONFIGURATORCMS", "root", "t00rt00r");
	
	$dbh = $inst->con( $inst->{"db_name"}, $inst->{"user"}, $inst->{"pw"} );

	$inst->db_crud( $dbh, $trunc_el, [] );
	
}
###################TODO - TRANSFORM PERL-ARRAY INTO JSON

1;
