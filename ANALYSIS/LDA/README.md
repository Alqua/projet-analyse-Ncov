After [cleaning the article](https://github.com/Alqua/projet-analyse-Ncov/tree/master/ANALYSIS/CLEANING%20articles), it is time for the LDA analysis. Before the analysis presented here, I did many try out that are available in the DRAFT part of this repo. I worked with jupyter notebook in python. I could have done it in R, but python and jupyter are more common for LDA analysis. I especially found more ressources and examples for LDA in chinese using python. Because the notebook actually uses the browser to display itself, it is possible to use extension such as dictionnaries. In this case, it was very convenient to be able to check very quickly chinese characters.
The main package for the LDA analysis is _gensim_ and _jieba_ as you can see in the jupyter notebook.

## LDA1.ipynb
The first analysis of the articles. It has been generated without an occurence filter: `id2word.filter_extremes(no_above= 0.29)` is commented out. It tells us the general topic of the database -> Coronavirus in China. We already knew that, but it proves that the database contains what the authors described, and also that our LDA process works.

## LDA2.ipynb
The second analysis of the articles. It has been generated with an occurence filter: `id2word.filter_extremes(no_above= 0.26)`
The theme generated are better defined and more interesting. For both analysis, I checked what is the best number of theme. Then, it is usually advised to choose the number of theme before the curve flatten.

## OUTPUT
Contains the result of the LDA analysis. What is published on the [website](https://alqua.github.io/website-nCovMemory-analysis/4-LDA/)

## html
contains an html version of LDA2.ipynb

## jieba_lists
Contains files to cut words and removing stopwords. First `UserWords.txt` is used as an argument to jieba in order to give a cutting priority to certain words. `stopwords.txt` is then using with a function I created to remove stopwords
