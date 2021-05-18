import os

def is_file_empty(file_name):
    """ Check if file is empty by reading first character in it"""
    # open ile in read mode
    with open(file_name, 'r') as read_obj:
        # read first character
        one_char = read_obj.read(1)
        # if not fetched then file is empty
        if not one_char:
           return True
    return False


#prepare list to save the name of empty files
lst=[]

#--getting path to files
le_chemin = 'cleaned_articles'  # write the subtitles folder path

filenames = os.listdir(le_chemin)

for filename in sorted(os.listdir(le_chemin)):  # for all file names in folder subtitles in order
    #ignore hidden files
    if filename[0] != '.':

        file_path = os.path.join(le_chemin, filename)  # Create path with folder path and file names
        #use function to check if the file is empty
        if is_file_empty(file_path) == True:
            #if file is empty, add name to the list
            lst.append(filename)

print(lst)

#saving results if any
outfile = open("files_to_check.txt", "w")
outfile.write(str(lst))
outfile.close()
