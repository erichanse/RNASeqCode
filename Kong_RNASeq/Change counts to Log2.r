

beforeLog2 <- read.csv("DESeq2.SumFiftyCounts.csv")

beforeLog2 <- column_to_rownames(beforeLog2, "X")

beforeLog2Add1 <- beforeLog2 +1

AfterLog2 <- log2(beforeLog2Add1)

write.csv(AfterLog2, "AfterLog2.DESeq2.SumFiftyCounts.csv", row.names=TRUE)
