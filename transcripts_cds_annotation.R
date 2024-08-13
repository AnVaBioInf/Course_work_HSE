# Загружаем IsoformSwitchAnalyzeR в окружение R.

if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("IsoformSwitchAnalyzeR")

library(IsoformSwitchAnalyzeR)

# Загружаем данные в R
TieQuant <- importIsoformExpression(
    parentDir=paste(path,"/ctab", sep=""), readLength=75
)

names(TieQuant)
head(TieQuant$abundance, 10)
head(TieQuant$counts, 10)
head(TieQuant$importOptions,10)

# Making a design matrix
myDesign <- data.frame(
    sampleID = colnames(TieQuant$abundance)[-1],
    condition = c('SRR1275413', 'SRR1275414', 'SRR1275415', 'SRR1275416')
)

myDesign

### Create switchAnalyzeRlist
aSwitchList <- importRdata(
    isoformCountMatrix   = TieQuant$counts,
    isoformRepExpression = TieQuant$abundance,
    designMatrix = myDesign,
    isoformExonAnnoation=paste(path,"/gtf/merged_annotation.gtf",sep=""),
    isoformNtFasta =paste(path,"/transcripts/transcripts.fasta", sep=""),
    fixStringTieAnnotationProblem = TRUE,
    estimateDifferentialGeneRange = FALSE,
    showProgress = TRUE
    )
    
summary(aSwitchList)
head(aSwitchList$isoformFeatures,2)
head(aSwitchList$exons,2)
head(aSwitchList$ntSequence,2)

# addORFfromGTF - Add CDS from a GTF file to a switchAnalyzeRlist.

ORF_known = addORFfromGTF(switchAnalyzeRlist = aSwitchList, 
            pathToGTF = "/home/an/Documents/Studies/HSE/course_work/human_genome/Homo_sapiens.GRCh37.87.gtf")
ORF_new = analyzeNovelIsoformORF(switchAnalyzeRlist =ORF_known,
       analysisAllIsoformsWithoutORF = FALSE)
head(ORF_known,4)

# Exporting list to a file

#define file name
sink('ORF_annotated.txt')

#print my_list to file
print(ORF_new$orfAnalysis)

#close external connection to file 
sink()


