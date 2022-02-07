## QC on FASTq reads using FastQC function

##Install rqc libary in r

if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
install.packages("fastqcr")

##Install library to this environment
library(fastqcr)

## Don't forget to set the working directory so it matches the code and 
## add a source file for the results 
## Run fastqcr

fastqc(fq.dir = "data/Trimmed_files", # FASTQ files directory
       qc.dir = "data/FASTQ_QC_files", # Results direcory
        fastqc.path = "~/Desktop/Kong_RNASeq/data/FastQC/fastqc",  #fastqc path
       threads = 4   )                 # Number of files read simultaneously


