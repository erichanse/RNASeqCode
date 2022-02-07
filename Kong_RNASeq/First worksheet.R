#020222 Eric Hanse RNAseq for Kong Lab


#install libraries 
install.packages("here")

install.packages("ggpubr")

install.packages(c("tidyverse", "here", "rmarkdown", "knitr", "kableExtra", "janitor", "scales", "ggpubr",
                   "pheatmap", "reshape2"))

install.packages("BiocManager")

BiocManager::install(c("clusterProfiler", "biomaRt", "edgeR", "limma", "Rsubread"))

remotes::install_github("wvictor14/plomics")

  title: "TOG RNA-seq Workshop 2021: Part 1 Worksheet" 
author: Eric_Hanse 
date: Feb2022
output: 
  html_document: 
  keep_md: yes 
toc: TRUE  
toc_depth: 4
toc_float: 
  collapsed: FALSE 
smooth_scroll: TRUE
theme: flatly
highlight:  
  --- 
### 1.0 Loading Packages and Data  
  
  
library(tidyverse)
library(rmarkdown)
library(here)
library(knitr)

#formatting libraries
library(kableExtra)
library(janitor)
library(scales)
library(ggpubr)

#Trim and Align
conda
