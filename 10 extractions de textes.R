##deux solutions pour télécharger les articles de Ncovmemory
##depuis archive.org, les nettoyer un minimum et les sauvegarder
##1:dans un dataframe // 2:fichier par fichier.

##set working directory
setwd()

##load package
##pour les opération sur les dataframe
library(dplyr)
##pour télécharger les textes et les nettoyer un minimum
library(htm2txt)
##Pour si jamais
library(httr)


##set locale as normal otherwise we cannot read data.csv properly
Sys.setlocale("LC_CTYPE","French_Switzerland.1252")

##import data
dataN <- read.csv("data.csv")

##put data into dplyr object
dataN2 <- tbl_df(dataN)

##select column id and link to archive.org
link <- select(dataN2, id, archive)

##select 10row for testing
link10 <- filter(link, id== 4444:4434)

##transform link10 as character
link10 <- link10 %>% mutate(archive=as.character(archive) )

##switch back to dataframe because dplyr ne fonctionne pas avec htm2text
linkA <- as.data.frame(link10)

##et mtnt ceci fonctionne as data.frame
text <- gettxt(linkA[1,2])


##rajouter une colonne avec un vecteur texte à notre dataframe
linkA[["text"]] <- sapply(linkA[,2], gettxt)

##test
linkA[1,3]

##avant de sauvegarder on se prépare l'utf
Sys.setlocale("LC_CTYPE","chinese")

##sauvegarder le dataframe en csv
write.csv(linkA, "test40.csv", row.names = FALSE, fileEncoding = "UTF-8")

##test read
linkt <- read.csv("test40.csv", encoding = "UTF-8")
 linkt[1,3]

 ##autre solution, une fonction qui télécharge chaques articles et les 
 ## enregistre suivant leur id en csv
 
 telechargive <- function(dataframe){
         
         for( i in rownames(linkA) ){
                 A <- linkA[i, "archive"]
                 x <- gettxt(as.character(A))
                 y <- as.character(linkA[i, "id"])
                 write.csv(x, file = paste(y, "csv", sep = "."), fileEncoding = "UTF-8" )
                 
         }
 }
telechargive(linkA) 

##testons un fichier
read.csv("4444.csv",encoding = "UTF-8")

##et attention aux sys locale a remettre ou non
Sys.setlocale("LC_CTYPE","French_Switzerland.1252")


Sys.getlocale()
Sys.setlocale(category = "LC_ALL", locale = "chinese")