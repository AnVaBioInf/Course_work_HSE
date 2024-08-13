#!/bin/bash

$programs/gffread/gffread \
-w $hek/transcripts/transcripts.fasta \
-g $human_genome/GRCh37.p13.genome.fa \
$hek/gtf/merged_annotation.gtf

head -10 $hek/transcripts/transcripts.fasta
