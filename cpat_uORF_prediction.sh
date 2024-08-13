#!/bin/bash

conda deactivate
cd /home/an/Downloads/CPAT-1.2.4/bin
python2 cpat.py -g '/home/an/Documents/Studies/HSE/course_work/hek/transcripts/transcripts.fasta'  -d ../dat/Human_logitModel.RData -x ../dat/Human_Hexamer.tsv -o '/home/an/Documents/Studies/HSE/course_work/hek/output2'
