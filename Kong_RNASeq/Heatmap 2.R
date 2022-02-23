## How to generate a simple heatmap from some top 
## regulated genes

# load package
library(pheatmap)


# install DESeq if necessary
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

# install and load packages
BiocManager::install("DESeq")
library(DESeq2)
library(tidyverse)
library(RColorBrewer)
library(viridis)

# load data into a data frame

PreData <- read.csv("named.parsed.limited.log2.csv", header=T, row.names = "gene")


## convert the data fram to a matrix that only includes genes that have a read
## sum of 50 or more. The higher you have this number the less genes will show.
data_subset <- as.matrix(PreData[rowSums(PreData)>50,])

# create heatmap using pheatmap
pheatmap(data_subset,
         color             = inferno(10),
         border_color      = NA,
         show_colnames     = TRUE,
         show_rownames     = FALSE,
         drop_levels       = TRUE,
         fontsize          = 14,
         main              = "020222 Organoid RNASeq")
