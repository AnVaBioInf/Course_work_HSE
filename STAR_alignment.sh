#!/bin/bash

# Шаг 1. Получаем геномные индексы 
$programs/STAR-2.7.10a/bin/Linux_x86_64_static/STAR \
--runThreadN 14 \
--runMode genomeGenerate \
--genomeDir /NEW_HDD/HDD_3TB/avasileva/course_work/indexes \
--genomeFastaFiles $human_genome_fasta \
--sjdbGTFfile $human_genome_gtf

# Шаг 2. Running mapping

# если команды разделять ; - они будут выполняться последовательно
files_id=('SRR1275413''SRR1275414' 'SRR1275415' 'SRR1275416')   # все имена файлов, которые нужно скачать

# –split-3 потому что есть парные риды
for i in "${files_id[@]}"; \
do \
$programs/STAR-2.7.10a/bin/Linux_x86_64_static/STAR \
--runThreadN 15 \
--genomeDir /NEW_HDD/HDD_3TB/avasileva/course_work/indexes \
--readFilesIn $hek/trimmed/${i}_1.fastq $hek/trimmed/${i}_2.fastq  \
--outSAMtype BAM Unsorted SortedByCoordinate \
--outFileNamePrefix $hek/bam/$i/$i \
--quantMode GeneCounts; \
done;

# –readFilesIn  - sequences to be mapped

# Посмотрим колонку TLEN в bam файле
$programs/samtools-1.9/samtools view -f 2 $hek/bam/SRR1275413/SRR1275413Aligned.sortedByCoord.out.bam | awk '{print $9}' > hist.txt
scp -r avasileva@172.21.136.153:/NEW_HDD/HDD_3TB/avasileva/hist.txt ~/Documents/Studies/HSE/course_work/hek/
