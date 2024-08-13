# перенос файлов с сервера на локальный компьютер

server = /NEW_HDD/HDD_3TB/avasileva/course_work
scp -r avasileva@172.21.136.153:/NEW_HDD/HDD_3TB/avasileva/course_work/HEK293/gtf ~/Documents/Studies/HSE/course_work
scp -r avasileva@172.21.136.153:/NEW_HDD/HDD_3TB/avasileva/course_work/HEK293/ctab ~/Documents/Studies/HSE/course_work/hek
scp -r avasileva@172.21.136.153:/NEW_HDD/HDD_3TB/avasileva/course_work/HEK293/bam/SRR1275413/SRR1275413Aligned.sortedByCoord.out.bam ~/Documents/Studies/HSE/course_work/hek;
scp -r avasileva@172.21.136.153:/NEW_HDD/HDD_3TB/avasileva/course_work/HEK293/bam/SRR1275414/SRR1275414Aligned.sortedByCoord.out.bam ~/Documents/Studies/HSE/course_work/hek;
scp -r avasileva@172.21.136.153:/NEW_HDD/HDD_3TB/avasileva/course_work/HEK293/bam/SRR1275415/SRR1275415Aligned.sortedByCoord.out.bam ~/Documents/Studies/HSE/course_work/hek;
scp -r avasileva@172.21.136.153:/NEW_HDD/HDD_3TB/avasileva/course_work/HEK293/bam/SRR1275416/SRR1275416Aligned.sortedByCoord.out.bam ~/Documents/Studies/HSE/course_work/hek;

wget -r "https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_19/GRCh37.p13.genome.fa.gz" -P $human_genome; # Comprehensive gene annotation
wget -r "https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_19/gencode.v19.chr_patch_hapl_scaff.annotation.gtf.gz" -P $human_genome #Genome sequence (GRCh37.p13)

scp -r avasileva@172.21.136.153:/NEW_HDD/HDD_3TB/avasileva/course_work/HEK293/fastq ~/Documents/Studies/HSE/course_work/hek
