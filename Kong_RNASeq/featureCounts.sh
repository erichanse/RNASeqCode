## Generate a file with the annotated genes mapped and counted
## install subread and feature counts
conda install -c bioconda subread
## open featurecounts through subread
conda create -c bioconda -n featurecounts subread
## activate the featurecounts channel
conda activate featurecounts

## run feature counts
featureCounts -p -a gencode.vM28.annotation.gtf -o count.out -T 4 *.bam
## p is paired end
## a is the annotation file
## o is the output
## -T is the number of threads
## *.bam is the input and it tells the code to use all the files in this directory
## with that extension>