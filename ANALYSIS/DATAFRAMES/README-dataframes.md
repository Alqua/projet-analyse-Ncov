* TOC
{:toc}

# Description of the dataframes:

## data.csv
is the original dataframe from the nCovMemory repo. The most important for all the analysis on this repo.

## 5table_media_nCov_handmade.xslx
is an excel files I created to know what kind of media are present in the database. For each media present in the database, I gathered some information about it, focussing on the media category and the place of publication. Out of the columns I added which are not present in data.csv, only those two are tidy data (one info per cell). The column remarques is in french and is just some personal notes about media, I left it in case it might be useful for someone.

## data_merge_handmade.csv
is a dataframes with data from both data.csv and 5table_media_nCov_handmade.xslx It allows us to make graphs using both dataframes datas.

## 2019-nCoV Stories for Translation-Sheet1.csv
is a file from the original repo nCovMemory, in which they planned to translate some articles. In this files we find some translation of the titles articles. (they did not pursue the full translation of the articles.

## data_with_en.csv 
is a dataframe made out of data.csv and 2019-nCoV Stories for Translation-Sheet1.csv The english titles column has been added

## translated_titles.csv

is a dataframes that I created to easily compare the english titles from the original data.csv and 2019-nCoV Stories for Translation-Sheet1.csv Only the rows populated with english titles from data_with_en.csv have been kept.

## code merging files
is a folder containing a jupyter notebook I wrote to merge some of those dataframes.
