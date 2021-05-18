import os
import re

#create functions:
#-cleaning (since ckiptagger can use delimiter, it can sometimes be useful not to clean everything below)
def filter(text):
    text = re.sub("[A-Za-z0-9\!\=\？\%\[\]\,\（\）\>\<\|:&lt;\/#\. -----\_「」←→·•％△▲▼↓；｜■④②\-\″+×]", "", text)
    text = re.sub("\n\n","",text)
    text = re.sub("\\t","",text)
    text = text.replace('image', '')
    text = text.replace('\xa0', '') # Delete nbsp
    # new
    r1 =  "\\【.*?】+|\\《.*?》+|\\#.*?#+|[.!/_,$&%^*()<>+""'?@|:~{}#]+|[——！\\\，。=？、：“”‘’￥……（）《》【】△▲▼↓■×]"
    cleanr = re.compile('<.*?>')
    text = re.sub(cleanr, ' ', text)        #Remove html tags
    text = re.sub(r1,'',text)
    text = text.strip()
    return text

#--getting path to files
le_chemin = 'data_and_csv_files'  # write the articles folder path

filenames = os.listdir(le_chemin)


#create folder for results
if not os.path.exists('cleaned_articles'):
    os.makedirs('cleaned_articles')

#cleaning one file at a time
for filename in sorted(os.listdir(le_chemin)):  # for all file names in folder subtitles in order
    #ignore hidden files
    if filename[0] != '.':

        file_path = os.path.join(le_chemin, filename)  # Create path with folder path and file names

        #print(file_path) #to check if the order is correct
        with open(file_path, 'r') as f2:
            data = f2.read() #take the text in the file
            data = filter(data) #clean
            namefile=filename[:-4] #remove extension name (.csv)
            #print(namefile)
            #save files
            with open(f'cleaned_articles/{namefile}.txt', 'w') as f:
                f.write(data)
