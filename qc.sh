#!/bin/bash

# триммируем образцы
mkdir trimmed

files_id=('SRR1275413' 'SRR1275414' 'SRR1275415' 'SRR1275416') 
for i in "${files_id[@]}"; \
do \
    java -jar $programs/Trimmomatic-0.39/trimmomatic-0.39.jar \
    PE -threads 7 \
    $hek/raw_data/fastaq/${i}_1.fastq $hek/raw_data/fastaq/${i}_2.fastq \
    $hek/trimmed/${i}_1.fastq $hek/trimmed/${i}_1_un.fastq $hek/trimmed/${i}_2.fastq $hek/trimmed/${i}_2_un.fastq \
    ILLUMINACLIP:$programs/Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10:2:true LEADING:3 TRAILING:3 MINLEN:36; \
done;

# для другого протокола адаптеров Illumina TruSeq2-PE.fa результаты триммирования были намного хуже
