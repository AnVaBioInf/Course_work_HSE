#!/bin/bash

# downloading the files
wget -r "https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_19/GRCh37.p13.genome.fa.gz" -P human_genome; # Comprehensive gene annotation
wget -r "https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_19/gencode.v19.chr_patch_hapl_scaff.annotation.gtf.gz" -P $human_genome #Genome sequence (GRCh37.p13)

# decompressing the files
gunzip -d /NEW_HDD/HDD_3TB/avasileva/course_work/human_genome/gencode/GRCh37.p13.genome.fa.gz
gunzip -d /NEW_HDD/HDD_3TB/avasileva/course_work/human_genome/gencode/gencode.v19.chr_patch_hapl_scaff.annotation.gtf.gz
