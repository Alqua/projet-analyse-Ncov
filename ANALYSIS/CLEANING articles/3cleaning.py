import os
import re

#create functions:
def nettoyage(text):
    text = re.sub("(?i)[А-ЯЁЇІЄҐ]", "", text)
    text = re.sub("[«»Ú©êüóáéíΕλληνικàèöä]","",text)
    return text

#--getting path to files
le_chemin = 'cleaned_articles'  # write the subtitles folder path

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
            data = nettoyage(data) #clean
            #namefile=filename[:-4] #remove extension name (.csv)
            #print(namefile)
            #save files
            with open(f'cleaned_articles/{filename}', 'w') as f:
                f.write(data)
