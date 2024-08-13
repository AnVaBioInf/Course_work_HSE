#!/bin/bash

awk '$3 ~ /(transcript|exon|CDS|UTR)/ {print $0}' *.gtf | \
awk '{if($0~"level (1|2);"){print $0}}' | \
awk '$0 ~ /gene_status \"KNOWN\";/ {print $0}' | \
awk '$0 ~ /transcript_status \"KNOWN"\;/ {print $0}' | \
awk '$0 !~ /cds_start_NF|cds_end_NF|mRNA_start_NF|mRNA_end_NF/ {print $0}' | \
awk '$0 ~ /transcript_type \"protein_coding\";/ {print $0}' > transcriptome.gtf
