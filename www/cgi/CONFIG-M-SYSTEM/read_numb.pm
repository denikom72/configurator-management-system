#!/usr/bin/perl
package read_numb;
#use strict;
use Data::Dumper;
#use lib '/var/www/cgi-bin/CONFIGURATORCMS';
use modules;
####CONSTRUCTOR### 
sub new { 
	my $type = shift;
  my $self = {};       
	bless $self, $type;
  $self;
}

####END###

####DB-METHODS###

sub printres {
	my $self = shift;
	my $args = shift;
	print "Content-type: text/json\n\n";
	
	my($ref) = (shift);
	open(NUMB, "<prodnumb.txt");
	while(<NUMB>){
		print;
	}
	close(NUMB);
	
}

1;
