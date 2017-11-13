#!/usr/bin/perl
package productlimit2;

our $accIns_el = sub {
    # make plausibility check with sprintf ...
    my ( $ref, $sql ) = ( shift, shift );
    $ins_post = $sql if $sql ne "";
    $ins_post;
};

####CONSTRUCTOR### 
sub new { 
	my $type = shift;
	my $param = shift;
    my $self = {};       
	bless $self, $type;
    $self;
}

sub printres {
	my($ref,$numb) = (shift, shift);
	open(NUMB, ">prodnumb.txt") or die("$!");
	print NUMB CGI->new->param('numOrPrice');
	# just to avoid error by client, cause it expect a json-answer	
	print "Content-type: text/json\n\n";
	close(NUMB);
}

1;
