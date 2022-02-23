## DESeq2
##


---
  title: "DESeq2"
  output: html_notebook
---
## load in the two librarys we need here to complete these tasks
library(DESeq2)
library (ggplot2) 
library(tibble)

## Assign your count csv file to a data frame called Counts
Counts <- read.delim("featurecount_reads_genename.txt", header = TRUE)  

## Assign the geneid to the row name
Counts <- column_to_rownames(Counts, var = "Geneid")

## Keep only the rows that have a sum of greater than 50, this is arbitrary
SumFiftyCounts <- Counts[which(rowSums(Counts) > 50),]
## look at the list and verify the new list is shorter
SumFiftyCounts

## Assign the column headers to the dataframe "condition"
condition <- factor(c("Con", "Con", "Con", "Con", "Con", "Con", "Con", "Exp","Exp","Exp","Exp","Exp", "Exp", "Exp"))
## Change the column headers to the indicated names
coldata <- data.frame(row.names = colnames(SumFiftyCounts), condition)

## assign your data set (Counts) to a DESeq data matrix
dds <- DESeqDataSetFromMatrix(countData = SumFiftyCounts, colData = coldata, design = ~condition)

## run DESeq and assign to the data frame dds. This task may take a second
dds <- DESeq(dds)

## Take a look at the data
vsdata <- vst(dds, blind = FALSE)

## Principal component analysis, dont forget to export
plotPCA(vsdata, intgroup = "condition")

## Plot dispersal estimate, dont forget to export, should stay under 1
plotDispEsts(dds)

## Generate a list of normalized counts for use in later analyses.
normalized_counts <- counts(dds, normalized = TRUE)

## Save your counts list here. This is a good file to use for heatmap.
write.csv(normalized_counts, file = "DESeq2.SumFiftyCounts.csv")

## Create a dataframe called res that runs stats package on dds data frame
## here we are comparing experimental to control, you can reverse this to change
## the perspective
res <- results(dds, contrast = c("condition", "Exp", "Con"))
## View your results
view(res)
## Cull the list of anything without a value
No_nas <- na.omit(res)
view(No_nas)
## Condense the list into only the significantly regulated genes
sigs <- No_nas[No_nas$padj < 0.05,]
## View the new list
view(sigs)

## These are the significant genes list and will be used for the next step
write.csv(sigs,"deseq2_results.csv")

