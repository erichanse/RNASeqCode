library(tidyverse)
library(pheatmap)
library(dplyr)
library(Rsubread)
library(ggplot2)
library(reshape2)

eDat = read.csv("named.parsed.limited.log2.csv", header = TRUE)
str(eDat)

pDat = read.csv("Conditions.csv", header = TRUE)

deDat <- eDat %>%
  distinct(Gene, .keep_all = TRUE)

deDat <- deDat %>%
  column_to_rownames(var = "Geneid")

all(colnames(deDat) == pDat$Condition)

dd_melt <- melt(deDat)

colnames(dd_melt)[1:2] <- c("variable", "expression")

dd_melt <- dd_melt %>%
  mutate(log_x_1 = log2(expression +1))

dd_melt %>%
ggplot(aes(x = log2(expression), color = "variable", fill = "variable")) +
  geom_density(alpha=0.1) +
  theme_minimal()+
  labs(x = "log2RPM", y = "Density", title = "Sample Distribution", subtitle = "020222 RNASeq\n")

dd_melt <- dd_melt %>%
        mutate(log_x_1 = log2(expression +1))

samp_cor <- cor(dd_melt)


pheatmap(deDat, clustering_distance_cols = "euclidean", clustering_method = "complete", cluster_rows = TRUE,
           show_colnames = FALSE, show_rownames = FALSE, main = "020222 RNASeq Heatmap")