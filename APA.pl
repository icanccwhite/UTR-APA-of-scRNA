#!/usr/bin/perl -w
###################################
# Author: Xiaoyu Zhou
# Email:  xyzh@biomed.au.dk
###################################

use strict;
use Math::Round;
my ($in,$out)=@ARGV;
my ($reads,$value,$choice);
open IN,$in or die $!;
open (OUT,'>',$out);
open (IN,'<',$in) or die "Can't open $in!";
while(<IN>){
	chomp;
    my @info = (split /\s+/, $_);
    my $strand = $info[7];
    if ($strand eq "+"){
    	$reads = $info[9];
    }else{
    	$reads = $info[10];
    }
    my @position = (split /,/, $reads);
    if ($reads eq "."){
    	$value = 0;
    	print OUT "NULL\t$value\t@info\t\n";
    }else{
    	my $count += $reads =~ s/,//g;
    	$value = $count +1;
    	if ($value > 40){
    		$choice = int($value/2) - 1;
    		print OUT "$position[$choice]\t$value\t@info\t\n";
    	}else{
    		print OUT "NULLow\t$value\t@info\t\n";
    	}
    }
}
close IN;
close OUT;
exit;

#my @distance;
while(<IN>){
	chomp;
	my @info = (split /\s+/, $_);
	my $count += $_ =~ s/NULL//g;
	my @distance = ();
	if ($count != 8){
		    for (my $i = 0; $i < 8; $i = $i + 1){
		    	print $i;
		    	my $tmp += $info[$i] =~ s/NULL//g;
		    	if($tmp == 0){
		    		push @distance, $info[$i];
		    	}
		    }
		    @distance = sort @distance;
		    #print "@sort\t\n";
		    my $dis = $sort[-1] - $sort[0];
		    $value = 8 - $count;
		    print OUT "$distance\t$value\t$info[8]\t$info[9]\t$info[10]\t$info[11]\t$info[12]\n";
	}else{
			next;
	}
}

close IN;

