#!/usr/bin/env Rscript

arguments = commandArgs(trailingOnly=TRUE)

 ## Default setting when no arguments passed
 if(length(arguments) < 1) {
    stop("The path to the MAF file is required and should be passed as first argument.")
 }


require(maftools)
input_file_path = arguments[1]

#read TCGA maf file
dataset = read.maf(maf = input_file_path, removeSilent = T, useAll = F)

plotmafSummary(maf = dataset, file = "summaryPlot", rmOutlier = T, addStat = 'median')

pdf("oncoplot_and_titv.pdf")
oncoplot(maf = dataset)
#dev.off()

#pdf("titv.pdf")
dataset.titv = titv(maf = dataset, useSyn = T)
dev.off()

