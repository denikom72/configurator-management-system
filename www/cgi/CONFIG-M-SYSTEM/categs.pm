#!/usr/bin/perl
package categs;
#use strict;
use Data::Dumper;
#use lib '/var/www/cgi-bin/CONFIGURATORCMS';
use modules;

my $cgi = CGI->new;

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
	print "Content-type: text/json\n\n";
	
	$res_set = $DB_DATA::inst->sel_query( $DB_DATA::dbh, $DB_DATA::sel_categs, [0] );
	print JSON->new->utf8->encode($res_set);
}

1;
