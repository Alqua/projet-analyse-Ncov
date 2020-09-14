setwd("~/UNI/master 19-20/cours de R/test xlsx")

data <- read.csv("data.csv", encoding = "UTF-8")

 ##Sys.getlocale()
## [1] "LC_COLLATE=French_Switzerland.1252;LC_CTYPE=French_Switzerland.1252;LC_MONETARY=French_Switzerland.1252;LC_NUMERIC=C;LC_TIME=French_Switzerland.1252"

library(data.table)
library(dplyr)
library(scales)
library(ggplot2)
library(ggfortify)

##fread and set id as key (match rownumber and id column)
z <- fread("data.csv", key = "id", encoding = "UTF-8")

##while downloading the articles, I noticed that the "id" column
##does not match the total number of articles. "id" goes up to 4444 while
##the number of row is 4425. Let's check which "id"s are missing

x <- c(1:4444)
t <- data[["id"]]

## substract full column x (count to 4444) minus "id"s column (t)
##what is left are the number of the missing ids
missing_id <- setdiff(x,t)

print (missing_id)
## [1]  232  233  234  235  296  646  647  648  670  675  676 1168 1317 2109 2201
## [16] 2465 2864 2871 2891

##verify that we found all of them
length(missing_id)
##[1] 19
4444-4425
##[1] 19
##we did! 

## add a clean URL column

z2 <- z %>%  
    mutate(url_new = case_when(grepl("weixin", url) ~ "weixin",
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

##place column url_new next to url for easier comparison

z2 <- z2 %>% select(1:8, last_col(),everything())

## save new dataframe

data.table::fwrite(x = z2, file = "newdata.csv", row.names = FALSE, bom = TRUE )

##check if encoding went alright (-> perfect)
check <- fread("newdata.csv", fill = TRUE, encoding = "UTF-8")

##repartition of articles within url
repartition <- as.data.frame(table(z2$url_new))

##percentage weixin (wechat)
label_percent(accuracy = 0.01)(3659/4425)
##[1] "82.69%"

## percentage caixin
label_percent(accuracy = 0.01)(426/4425)
##[1] "9.63%"

##count censored articles
censored_articles <- z[, is_deleted]
sum(censored_articles, na.rm = TRUE)

## select censored articles
censored_articles <- filter(z, is_deleted = TRUE)

##Percentage of censored articles
label_percent()(103/4425)
## [1] "2%"

##More precise percentage
label_percent(accuracy = 0.01)(103/4425)
##[1] "2.33%"


## number of non fiction writing in the censored articles
table(censored_articles$category %in% c("non_fiction"))
## in percentage non fiction
label_percent(accuracy = 0.01)(68/103)
##[1] "66.02%"

## in percentage narrative
label_percent(accuracy = 0.01)(35/103)
##[1] "33.98%"

##Count of censored articles per media
censored_media_count <- as.data.frame(table(censored_articles$media))

hist(censored_media_count$Freq, main="number of censored article per media",col="red",xlab="Media",ylab="Fréquence")

##Count of censored articles per date
censored_date_count <- as.data.frame(table(censored_articles$date))

##essai plot
plot1 <- ggplot(censored_date_count, aes(x=Var1)) + geom_bar(stat = "Freq") + labs(title="Frequency bar chart")  # Y axis derived from counts of X item
print(plot1)

