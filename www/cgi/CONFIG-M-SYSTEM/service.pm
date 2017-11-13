#!/usr/bin/perl
package service;
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
	$res_set = $DB_DATA::inst->sel_query( $DB_DATA::dbh, $DB_DATA::sel_all, [] );
	
	##########CONVERTER - LIST OF LIST TO LIST OF HASHREFs
	
	my ( $max, $ind, @listOfHash ) = ( 0, 0 );
	
	map {
			if( $max < $_->[2] ){
			$max = $_->[2];
		}	
	} @{$res_set};
	
	
	
	
	for my $i( 0..$max ){
		#print;
		my ( %tmphash, @tmplist );
		my $ind = 0;
		map {
			if($_->[2] == $i && $_->[2] != 0){
				#print $res_set->[$i-1]->[1];
	
				#id begins from 1 and the row indisizes from 0, so that's why [$i-1]
				$tmphash{ $res_set->[$i-1]->[1] }->[$ind] = [ $_->[1], "EUR:".$_->[3] ];
	
				#@tmplist = ( @tmplist, $_->[1] );
				$ind++;
				#print "yess";
			}
		} @{$res_set};
	
		my @keysnumb = keys %tmphash;
		
		#print Dumper \%tmphash if $#keysnumb > -1; 
		#DONT FILL LIST WITH EMPTY HASHES, CREATED BY THE LOOP for example - max. is 4, but 3 and 2 are not categories ....
		push( @listOfHash, \%tmphash ) if $#keysnumb > -1;
	}
	
	#############END CONVERTER####################
	
	print JSON->new->utf8->encode(\@listOfHash);
}

1;
