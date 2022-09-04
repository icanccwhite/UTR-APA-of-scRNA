#!/usr/bin/perl -w
###################################
# Author: Xiaoyu Zhou
# Email:  xyzh@biomed.au.dk
###################################

use strict;

my ($indepth,$gene_bed,$outdir) = @ARGV;
print "Usage: perl perl_file coverage_file gene_bed out_file\n";

my %gene_bed;
open (BED,'<',$gene_bed) or die "Can't open $gene_bed!";
while (<BED>) {
        chomp;
        my @info = (split /\s+/, $_);
        my $gene = $info[5];
        my $chr = $info[0];
        my $start = $info[1];
        my $end = $info[2];
        my $bed = "";
        if ($info[3] eq "+"){
        		$bed = $chr."_".$start."_+_".$end;
        }else{
        		$bed = $chr."_".$start."_-_".$end;
        }
        $gene_bed{$bed} = $gene;
        #print "$bed\t$gene_bed{$bed}\n";
}
close BED;

my %hash;
open (DEPTH,'<',$indepth) or die "Can't open $indepth!";
while (<DEPTH>) {
		chomp;
		my @info = (split /\s+/, $_);
		#my $chr = $info[0];
		my $site = $info[1];
		my $depth = $info[2];
		#$hash{$chr}{$site} = $depth;
		$hash{$site} = $depth;
		#print "$chr\t$site\t$hash{$chr}{$site}\n";
}
close DEPTH;


use List::Util qw(sum);
use POSIX;
sub median {
        sum((sort { $a <=> $b } @_ )[int($#_/2), ceil($#_/2)])/2;
}

my %width;
open (OUT,'>',$outdir);
foreach my $bed (keys %gene_bed){
		print "$bed\t";
		my @point = (split /_/, $bed);
		my $chr = $point[0];
		my $start = $point[1];
		my $strand = $point[2];
		my $end = $point[3];
		my $length = $end - $start + 1;
		#my $percent = 0;
		#my $density = 0;
		#my @str = ();
		my $position = "";
		#foreach $chr (keys %hash){
		foreach my $site (keys %hash){
		#	foreach my $site (keys %{$hash{$chr}}) {
				#if ($bed =~ /^$chr/){
						if($site < $start){
								next;
						}elsif (($site >= $start)&&($site <= $end)){
							if($hash{$site} > 0){
								if ($strand eq "+"){
										$position = $site - $start + 1;
								}else{
										$position = $end - $site + 1;
								}
								my $percent = $position."/".$length;
								push @{$width{$bed}}, $hash{$site};
								my $expect = sum(@{$width{$bed}}) / median(@{$width{$bed}});
								print OUT "$chr\t$site\t$hash{$site}\t$strand\t$percent\t$expect\t$gene_bed{$bed}\n";
							}else{
								next;
							}
						}elsif ($site > $end){
								last;
						}
				#}else{
				#		last;
				}
				if (exists $width{$bed}){
					print "@{$width{$bed}}\t\n";
				}else{
					print "\n";
					last;
				}
			#}
		#}
		#print "\n";
		#$width{$bed} = @str;
}
close OUT;
exit;
