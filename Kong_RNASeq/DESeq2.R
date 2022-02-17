## DESeq2
##


---
  title: "DESeq2"
  output: html_notebook
---
## load in the two librarys we need here to complete these tasks
library(DESeq2)
library (ggplot2)  

## Assign your count csv file to a data frame called Counts
Counts <- read.delim("020222.count.out.csv", header = TRUE, row.names = 1, sep = ",")  

## Keep only the rows that have a sum of greater than 50, this is arbitrary
Counts <- Counts[which(rowSums(Counts) > 50),]
## look at the list
Counts

## Assign the column headers to the dataframe "condition"
condition <- factor(c("Con","Con","Con","Con","Con","Con","Pio","Pio","Pio","Pio","Pio","Pio"))
## Change the column headers to the indicated names
coldata <- data.frame(row.names = colnames(Counts), condition)

## assign your data set (Counts) to a DESeq data matrix
dds <- DESeqDataSetFromMatrix(countData = Counts, colData = coldata, design = ~condition)

## run DESeq and assign to the data fram dds. This task may take a second
dds <- DESeq(dds)

## Take a look at the data
vsdata <- vst(dds, blind = FALSE)

## Principal component analysis, dont forget to export
plotPCA(vsdata, intgroup = "condition")

## Plot dispersal estimate, dont forget to export, should stay under 1
plotDispEsts(dds)

## Create a dataframe called res that runs stats package on dds data frame
## here we are comparing experimental to control, you can reverse this to change
## the perspective
res <- results(dds, contrast = c("condition", "Pio", "Con"))
## View your results
res
## Cull the list of anything without a value
sigs <- na.omit(res)
## Condense the list into only the significantly regulated genes
sigs <- sigs[sigs$padj < 0.05,]
## View the new list
sigs

## These are the significant genes list and will be used for the next step
write.csv(sigs,"deseq2_results.csv")

