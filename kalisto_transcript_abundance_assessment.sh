#!/bin/bash

$programs/kallisto/kallisto index -i transcripts.idx $hek/transcripts/transcripts.fasta

files_id=('SRR1275413' 'SRR1275414' 'SRR1275415' 'SRR1275416')
for i in "${files_id[@]}"; \
do \
mkdir $hek/kallisto/$i
$programs/kallisto/kallisto quant -t 7 -i transcripts.idx -o $hek/kallisto/$i $hek/fastq/${i}_1.fastq $hek/fastq/${i}_2.fastq; \
done
