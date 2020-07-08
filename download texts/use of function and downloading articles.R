##set working directory
setwd()

##load package
##pour les opération sur les dataframe
library(dplyr)
##pour télécharger les textes et les nettoyer un minimum
library(htm2txt)
##Pour si jamais
library(httr)
##for sorting and writing
library(data.table)
##cleaning opration of chinese texts
library(chinese.misc)
library(jiebaR)
##for percentage
library(scales)


data <- fread("data.csv",key = "id", encoding = "UTF-8")

telechargive <- function(dataframe, col1, col2){
    ##this function extract texts from webpages with getxt following a list
    ##of links in col1, save each text in a document and name the document
    ## following a list in col2
    ##example of call:
    ##telechargive(dataframe = linkA, col1 = "archive", col2 = "id")
    
    for( i in rownames(dataframe) ){tryCatch({
        A <- dataframe[i, col1]
        x <- gettxt(as.character(A))
        y <- as.character(dataframe[i, col2])
        write.csv(x, file = paste(y, "csv", sep = "."), fileEncoding = "UTF-8" )
        
    }, error=function(e){cat("ERROR :",conditionMessage(e), "\n")})
    }}

##before saving the data prepare to UTF-8
Sys.setlocale("LC_CTYPE","chinese")

##function only work on dataframe
data <- as.data.frame(data)

##function call on data

telechargive(dataframe = data, col1 = "archive", col2 = "id")

##sometimes after a certain number of download archive.org is blocking
##the process, or if there is a freeze in the connection, creating a
##consequent amount of error. In this case it is better to stop the function
## check last files just in case, and restart where it froze, later or with
## a vpn

##check files
art <- read.csv("4444.csv",encoding = "UTF-8")

##create another dataframe where it stoped
newdata <- data[-c(1:462),]

##new function call
telechargive(dataframe = newdata, col1 = "archive", col2 = "id")

##however sometimes the problem does not come from archive, rather
##it is the link which is not good or something else
##in this case we can check which are the file missing

a <- list.files(, all.files = TRUE ,full.names = FALSE)

## remove ".csv" 

b <- gsub(".csv", "", a)

## make a vector out of the column id
t <- data[["id"]]

## substract full column (t) minus incomplete column (c)
##what is left are the number of the missing files
missing_files_no <- setdiff(t,b)

##create a dataframe with missing files
missing <-subset(data, id %in% missing_files_no)
missing <- as.data.frame(missing)


##arrange rownames with id
missing <- arrange(missing, missing$id)

##function call on "missing", then test again for missing files
telechargive(dataframe = missing, col1 = "archive", col2 = "id")

## some files are still missing after calling again the function
##a few times. We probably can do the analysis without it but some censored
##articles are missing too, and those are important for analysis, let's
##check which one

cen_missing <- filter(missing, is_deleted == TRUE)

##and we can download the articles one by one

c <- gettxt("https://mp.weixin.qq.com/s/PKi7uaFhAW7-Tkh9Oy13Rw")

c <- as.character2(c)

##clean again to avoid reading dataframe problem 
## it does clean more than other articles because of the function used
##probably not a problem but it does change the text
d <- slim_text(c, rm_eng = TRUE)

##save file
write.csv(d, "139.csv" , fileEncoding = "UTF-8")
##check
art2 <- read.csv("139.csv",encoding = "UTF-8")

##from the articles left we can also check the original URL however
##caixin seems difficult because of the format of the webpage
##therefore we select only WeChat/weixin first 

##add column to sort (this is a code that I used on the whole database)
##I am recycling it here)
missing2 <- missing %>%   mutate(url_new = case_when(grepl("weixin", url) ~ "weixin",
                                     grepl("caixin", url) ~"caixin",
                                     grepl("weibo", url) ~ "weibo",
                                     grepl("bjnews", url) ~ "bjnews",
                                     grepl("cb", url) ~ "cb",
                                     grepl("ceweekly", url) ~ "ceweekly",
                                     grepl("chuapp", url) ~ "chuapp",
                                     grepl("dxy", url) ~ "dxy",
                                     grepl("eeo", url) ~ "eeo",
                                     grepl("gcores", url) ~ "gcores",
                                     grepl("ifeng", url) ~ "ifeng",
                                     grepl("inews.qq", url) ~ "inews.qq",
                                     grepl("infzm", url) ~ "infzm",
                                     grepl("jiemian", url) ~ "jiemian",
                                     grepl("new.qq", url) ~ "new.qq",
                                     grepl("neweekly", url) ~ "neweekly",
                                     grepl("oeeee", url) ~ "oeeee",
                                     grepl("sohu", url) ~ "sohu",
                                     grepl("thepaper", url) ~ "thepaper",
                                     grepl("titan24", url) ~ "titan24",
                                     grepl("toutiao", url) ~ "toutiao",
                                     grepl("whb", url) ~ "whb",
                                     grepl("wxn", url) ~ "wxn",
                                     grepl("xueqiu", url) ~ "xueqiu",
                                     grepl("yicai", url) ~ "yicai",
                                     grepl("yystv", url) ~ "yystv",
                                     grepl("zhishifenzi", url) ~ "zhishifenzi",
                                     grepl("zhisland", url) ~ "zhisland",
    ))
##sort by column
missing_weixin <-subset(missing2, url_new %in% "weixin" )

##function call on missing_weixin
telechargive(dataframe = missing_weixin,col1 = "url", col2 = "id" )

##The remaining articles can't be downloaded because of an error 404
##on the archive.org link and because of a paywall on the original
##link on caixin, or unexistant page for 1 articles on titan24
missing$id
##[1] 2721 3893 3904 3905 3907 3908 3909 3910 3912

##9 articles missing on 4425, chance of successful download
label_percent(accuracy = 0.01)(9/4425)
##[1] "0.20%"

##bring back sys locale to normal
Sys.setlocale("LC_CTYPE","French_Switzerland.1252")

##check sys locale
Sys.getlocale()
