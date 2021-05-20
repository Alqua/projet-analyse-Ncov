# Introduction:encoding troubles
I first started to create this function to download all the articles from the list of link to an archiving website (mostly archive.today) using windows. I had many problems with encoding the character because windows does not really support UTF-8 at a system level, even though they seem to be slowly starting to work on that. That is the reason behind the changes of system language within R studio with: `Sys.setlocale("LC_CTYPE","chinese")`. I must also say that encoding problems will also depend on the base language chosen in windows, if a user selected chinese, that won't likely create any problem to encode chinese.
After a change in hardware, I started to code in a linux virtual machine using VMWare and all encoding problems were gone :)

# File description
## function extract texts from list of webpage links.R
The function I created only.
I used this function 2 times. The second time I added `Sys.sleep(1)` which add 1 second between each download and most important I contacted the webmaster of archive.today to ask him if I could make numerous downloads from his site. He agreed and added my IP address to a whitelist. Contacting the website is important because otherwise a large amount of downloads could be flaged as a DDOS attack attempt.
I saved the files naming them with the articles'id + ".csv" extension. Looking back, it would have been better to use ".txt"

## use of function and downloading articles.R
The code I actually used to download the article. How to start the function, re-start it, check for missing files,etc.
