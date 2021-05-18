import os
import re

def nettoyage(text):
    #text = text.encode() # convert context from str to unicode
    filtrate = re.compile(u'[^\u4E00-\u9FA5]') # non-Chinese unicode range
    text = filtrate.sub(r'', text) # remove all non-Chinese characters
    #text = text.decode() # convert unicode back to str
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
