library(tidyverse)
library(pheatmap)
library(dplyr)
library(Rsubread)
library(ggplot2)
library(reshape2)


## Read in files eDAT is the expression counts and pDAT are your conditions
eDat = read.csv("named.parsed.limited.log2.csv", header = TRUE)
str(eDat)

## Read in condition file
pDat = read.csv("Conditions.csv", header = TRUE)

## Get rid of duplicate gene names
deDat <- eDat %>%
  distinct(Gene, .keep_all = TRUE)

## Make the strings "gene ids" become row assignments
deDat <- deDat %>%
  column_to_rownames(var = "Gene")
## This is a check to make sure your previous commands worked 
## it should return true
all(colnames(deDat) == pDat$Condition)

## Melt data into two columns
dd_melt <- melt(deDat)

## Assign these columns new names
colnames(dd_melt)[1:2] <- c("variable", "expression")

## Make the numbers log2
dd_melt <- dd_melt %>%
  mutate(log_x_1 = log2(expression +1))

## Plot the values to look at the distribution of counts
dd_melt %>%
ggplot(aes(x = log2(expression), color = "variable", fill = "variable")) +
  geom_density(alpha=0.1) +
  theme_minimal()+
  labs(x = "log2RPM", y = "Density", title = "Sample Distribution", subtitle = "020222 RNASeq\n")

