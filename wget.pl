#!/usr/bin/perl -w
#use strict;

my ($sra_list) = @ARGV;
my $name = (split /\./, $sra_list)[0];
print "ID:$name\n";
#my @donor = ("Donor1", "Donor2");
#print "@donor\t\n";
#my $address = "./SRP217906";
#my @sample = ();
open (IN, '<', $sra_list) or die $!;
while (<IN>){
        chomp;
        next if /^#/;
        `wget -bc $_`;
        #my $file = $_;
        #$_ =~ s/.gz.1//;
        #my @name = (split /_/, $_);
        #my $newfile = "$name[0]_$name[2]_L$name[1]_$name[3]_$name[4]";
        #print "$newfile\n";
        #`zcat $file >$newfile`;
        #if ($newfile =~ /cells/){
        #       if ($newfile =~ /^$donor[0]/){
                        #print "zcat $file >$address/$donor[0]/sc/$_\n";
                        #`zcat $file >$address/$donor[0]/sc/$_ &`;
        #               `mv $newfile $address/$donor[0]/sc`;
        #       }
        #       elsif ($newfile =~ /^$donor[1]/){
                        #print "zcat $file >$address/$donor[1]/sc/$_\n";
                        #`zcat $file >$address/$donor[1]/sc/$_ &`;
        #               `mv $newfile $address/$donor[1]/sc`;
        #       }else{
        #               next;
        #       }
        #}else{
        #       next;
        #}
}
                #my @t = split /\t/;
                #my $organ = (split /\s+/, $t[0])[0]; 
                #if ($t[0] =~ /.*\s.*/){
                #       $organ = (split /\s+/, $t[0])[0]."_".(split /\s+/, $t[0])[1]; 
                #}
                #push @sample, $organ;
                #print "$t[0]\t$organ\n";
                #`mkdir -p organ/$organ/rawdata organ/$organ/output`;
                #my $link = "ftp://ftp.ebi.ac.uk/pub/databases/microarray/data/experiment/MTAB/E-MTAB-8077/$t[0].fastq.gz";
                #print "$link\n";
                #print "$t[-5]\t$t[-7]\n";
                #my $fq1 = (split /\//, $t[-5])[-1];
                #my $fq2 = (split /\//, $t[-7])[-1];
                #print "$fq1\t$fq2\n";
                #`mv $fq1 $fq2 organ/$organ/rawdata`;
                #print "mv $fq1 $fq2 organ/$organ\n";
        #}
#}
                #@sample = grep { ++$hash{$_} < 2 } @sample;
                #print "@sample\t\n";
                #foreach (@sample){
                #       print "$_\n";           
                #       if ($_ =~/muscle_Soleus/){
                #               $id=$_."_".$fq_tag
                #               `nohup cellranger-3.1.0/cellranger-cs/3.1.0/bin/cellranger count --id=$id --transcriptome=mm10 --fastqs=/dellfsqd2/ST_LBI/USER/zhouxiaoyu/scRNA-seq/ECs/mouse/fastq/organ/$_/rawdata --sample=$fq_tag --expect-cells=3000 &`;
                #       }else{
                #               `nohup cellranger-3.1.0/cellranger-cs/3.1.0/bin/cellranger count --id=$id --transcriptome=mm10 --fastqs=/dellfsqd2/ST_LBI/USER/zhouxiaoyu/scRNA-seq/ECs/mouse/fastq/organ/$_/rawdata --sample=$fq_tag --expect-cells=5000 &`;
                #       }
                #}
                #`wget -bc $link`;
                #`wget -bc $t[-9]`;
                #`wget -bc $t[-7]`;
                #`wget -bc $t[-5]`;
        #}else{
        #       next;
        #} 
#}
close IN;
exit;
