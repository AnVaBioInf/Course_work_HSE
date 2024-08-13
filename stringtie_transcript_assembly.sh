#!/bin/bash

files_id=('SRR1275413' 'SRR1275414' 'SRR1275415' 'SRR1275416')

# for each RNA-Seq sample, run StringTie to assemble the read alignments 
for i in "${files_id[@]}"; \
do \
$programs/stringtie-2.2.1.Linux_x86_64/stringtie \
-v -p 15 \
-m 100 \
-o $hek/gtf/${i}.gtf \
-G $human_genome_gtf \
$hek/bam/$i/${i}Aligned.sortedByCoord.out.bam; \
done;

head -10 $hek/gtf/SRR1275413.gtf


# run StringTie with --merge in order to generate a non-redundant set of transcripts observed in any of 
# the RNA-Seq samples assembled previously. 
$programs/stringtie-2.2.1.Linux_x86_64/stringtie \
--merge \
-v $hek/gtf/SRR1275413.gtf \
$hek/gtf/SRR1275414.gtf \
$hek/gtf/SRR1275415.gtf \
$hek/gtf/SRR1275416.gtf \
-G $human_genome_gtf \
-m 100 \
-o $hek/gtf/merged_annotation.gtf

head -10 $hek/gtf/merged_annotation.gtf


# for each RNA-Seq sample, run StringTie using the -B/-b and -e options in order 
# to estimate transcript abundances and generate read coverage tables for Ballgown. 
for i in "${files_id[@]}"; \
do \
$programs/stringtie-2.2.1.Linux_x86_64/stringtie \
-p 300 \
-m 100 \
-eb $hek/ctab/${i}.ctab \
-G $hek/gtf/merged_annotation.gtf \
-o $hek/gtf/${i}_merged_annotation.gtf \
$hek/bam/$i/${i}Aligned.sortedByCoord.out.bam; \
done;

head -10 $hek/gtf/SRR1275413_merged_annotation.gtf
head -10 $hek/ctab/SRR1275413.ctab
