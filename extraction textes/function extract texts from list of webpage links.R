##set working directory
setwd()

##load package
##pour les opération sur les dataframe
library(dplyr)
##pour télécharger les textes et les nettoyer un minimum
library(htm2txt)
##Pour si jamais
library(httr)

telechargive <- function(dataframe, col1, col2){
    ##this function extract texts from webpages with getxt following a list
    ##of links in col1, save each text in a document and name the document
    ## following a list in col2
    ##example of call:
    ##telechargive(dataframe = linkA, col1 = "archive", col2 = "id")
    
    for( i in rownames(dataframe) ){
        A <- dataframe[i, col1]
        x <- gettxt(as.character(A))
        y <- as.character(linkA[i, col2])
        write.csv(x, file = paste(y, "csv", sep = "."), fileEncoding = "UTF-8" )
        
    }
}