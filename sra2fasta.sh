#!/bin/bash

# запускаем фоновый режим
screen -S DOWNLOAD_RAW 
files_id=('SRR1275413.sra' 'SRR1275414.sra' 'SRR1275415.sra' 'SRR1275416.sra')   # все имена файлов, которые нужно скачать

# функция скачивающая все файлы
# –split-3 потому что есть парные риды
for i in "${files_id[@]}"; \
do \
sra_tools/fasterq-dump  \
hek/sra_files/$i  \
-p \
-x \
-O hek/raw_fasta ; \
done;

# Ctrl+a+d # выйти из screen
# screen -r 4833.DOWNLOAD_RAW # to come back to screen
# screen -X -S 13240.DOWNLOAD_raw quit  #удалить фоновое окно
# head -10 hek/raw_fasta/SRR1275413_1.fasta
