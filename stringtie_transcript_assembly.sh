#!/bin/bash

files_id=('SRR1275413' 'SRR1275414' 'SRR1275415' 'SRR1275416')

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
