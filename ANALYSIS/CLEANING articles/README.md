# The cleaning Process

In this folder, I placed the script I used to clean the articles.
In order to have good result from an LDA theme analysis, it is important to first clean the articles. For every language, this process is slightly different and different methodes are used. 

In my case, this process was a back and forth between the analysis and the cleaning part. Indeed, when I thought I was ready to publish the LDA analysis, I found out that the most representative article of a certain theme category was in fact in russian.
I had to go back to cleaning and checking the quality of the articles.
The problematic articles can be generated from the download fonction in case of a bug in formatting for example, or the archive can be corrupted or even the first source can contain error.

`cleaning_texts.py` is the first script (in python) I used to clean the articles. It removes special characters, numbers and latin alphabet. We only want to keep mandarin characters. It also converts the files from csv to txt (looking back the download function should have directly save the articles in txt).

`checkfiles.py` is then used to check if any files are actually empty and return back the id number of those files. We can then use this number to find the articles in the database and download it "by hand".

`3cleaning.py` takes the files which have already been cleaned once and further removes some special characters, russian, ukrainian and greek letters (yes, all those languages were present and I discovered them one by one).

I thought about using a script to directly selecting only mandarin character with the script `cleaning_only_chinese.py`. However, this solution converts japanese characters into random chinese characters, because their unicode are close. I chose not to use this solution because it would not give me the opportunity to recognise if there was any article in japanese and correct it if that was the case. Turns out, only one article was in japanese.

`checkfiles.py` is then used again to check if any files is empty.

`articles_vides_bas.md` lists all the articles which were empty and states what has been done with it. This document is in french though. Most decision was if the article has been retrieved through a copy/past (copié/collé) of the webpage or if it was not possible to do that and why. In that case, the article was deleted (supprimé). I also had to redo the whole process once I noticed that I did not use the last version of data.csv the first time, this is also present in this files. And I checked as well some articles which had a number of character suprisingly low. A few contained errors but the majority were articles presenting images.

### cleaning-caixin
This directory contains the script I used once I discovered that all the articles from caixin had not been cleaned properly. They all contained a header with the same words and therefore creating a category by themselves. I deleted those lines.
