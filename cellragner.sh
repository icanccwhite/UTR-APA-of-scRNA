#!/bin/bash -
ref="./10x/hg19-3.0.0.premrna"
echo "$ref if your refdata"
list=`pwd`
address="${list}/fastq"
echo "check $address"
#cellranger="./software/cellranger-3.1.0/cellranger-cs/3.1.0/bin/cellranger"
cellranger="./software/cellranger-3.1.0/cellranger-cs/3.1.0/bin/cellranger"
#for dir in `ls $list`
#do
        #echo $dir
        if [ -d "fastq" ]
        then
                echo "Here are:"
                for donor in `ls $address`
                do
                        sample=`basename $donor`
                        count=`ls $address/$sample|wc -w`
                        if [ "$count" > "0" ];
                        then
                                fq_tag=${sample%_sn}
                                echo $fq_tag
                                id="${fq_tag}_sn"
                                echo $id
                                echo "file size $count"
                                $cellranger count --id=$fq_tag --transcriptome=$ref --fastqs=$address/$id --sample=$fq_tag
                                echo "$cellranger count --id=$fq_tag --transcriptome=$ref --fastqs=$address/$id --sample=$fq_tag"
                        else
                                echo "empty!"
                        fi
                done
        else
                echo "no fastq!"
        fi
#done
