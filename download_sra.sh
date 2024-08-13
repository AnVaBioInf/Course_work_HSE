#!/bin/bash
# запускаем фоновый режим
screen -S DOWNLOAD_RAW 
files_id=('SRR1275413' 'SRR1275414' 'SRR1275415' 'SRR1275416')   # все имена файлов, которые нужно скачать
# функция скачивающая все файлы
for i in "${files_id[@]}"; \
do \
sra_tools/prefetch \
-p \
-O hek/sra_files $i; \
done;

Ctrl+a+d # выйти из screen
screen -ls
screen -r 4833.DOWNLOAD_RAW # to come back to screen
screen -X -S 13240.DOWNLOAD_raw quit  #удалить фоновое окно

head -10 /NEW_HDD/HDD_3TB/avasileva/HEK293/sra_files/SRR1275413.sra
