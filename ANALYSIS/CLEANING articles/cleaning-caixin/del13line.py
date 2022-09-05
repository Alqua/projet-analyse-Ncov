import os
import re

caixin_id = [4720, 4719, 4700, 4699, 4647, 4646, 4645, 4644, 4643, 4562, 4561, 4560, 4559, 4506, 4505, 4504, 4503, 4502, 4428, 4427, 4426, 4385, 4384, 4383, 4307, 4306, 4305, 4304, 4303, 4302, 4248, 4230, 4229, 4228, 4118, 4117, 4116, 4115, 4114, 4113, 4077, 4076, 4075, 4074, 4073, 4072, 4071, 4070, 4069, 3968, 3967, 3966, 3965, 3913, 3912, 3911, 3910, 3909, 3908, 3907, 3906, 3905, 3904, 3903, 3902, 3901, 3900, 3899, 3898, 3897, 3896, 3895, 3894, 3737, 3736, 3735, 3734, 3733, 3732, 3731, 3730, 3729, 3640, 3639, 3638, 3637, 3636, 3635, 3634, 3633, 3632, 3631, 3572, 3571, 3570, 3569, 3568, 3567, 3451, 3450, 3429, 3428, 3403, 3402, 3401, 3400, 3399, 3398, 3397, 3396, 3368, 3367, 3366, 3365, 3364, 3363, 3362, 3361, 3360, 3359, 3358, 3357, 3282, 3281, 3280, 3279, 3278, 3277, 3276, 3275, 3274, 3273, 3272, 3245, 3244, 3243, 3242, 3241, 3240, 3239, 3238, 3237, 3236, 3235, 3234, 3233, 3232, 3141, 3091, 3090, 3089, 3088, 3087, 3086, 3085, 3084, 3083, 3082, 3081, 3080, 3079, 3078, 3077, 3043, 2885, 2884, 2883, 2882, 2881, 2880, 2876, 2875, 2793, 2792, 2791, 2790, 2789, 2788, 2787, 2725, 2724, 2723, 2722, 2721, 2682, 2681, 2680, 2679, 2678, 2677, 2676, 2675, 2674, 2673, 2540, 2539, 2538, 2537, 2536, 2535, 2534, 2533, 2532, 2531, 2530, 2529, 2528, 2527, 2526, 2525, 2524, 2523, 2522, 2521, 2520, 2519, 2518, 2517, 2516, 2515, 2514, 2367, 2366, 2365, 2364, 2363, 2362, 2361, 2360, 2359, 2358, 2357, 2356, 2355, 2354, 2353, 2352, 2351, 2350, 2349, 2348, 2347, 2302, 2301, 2300, 2299, 2298, 2262, 2261, 2260, 2184, 2183, 2182, 2181, 2180, 2100, 2099, 2098, 1632, 1583, 1582, 1581, 1580, 1579, 1578, 1577, 1576, 1575, 1574, 1573, 1572, 1571, 1570, 1569, 1568, 1567, 1287, 1286, 1285, 1284, 1203, 1202, 1201, 1137, 1136, 1135, 1134, 1133, 1132, 1131, 1130, 1129, 1128, 1127, 1126, 855, 854, 853, 852, 851, 850, 849, 777, 776, 775, 774, 773, 772, 771, 770, 769, 768, 767, 766, 765, 764, 763, 762, 761, 716, 478, 477, 476, 475, 474, 385, 384, 383, 282, 281, 280, 279, 278, 277, 276, 275, 274, 273, 272, 271, 270, 269, 268, 267, 266, 265, 264, 263, 262, 261, 260, 259, 258, 257, 256, 255, 254, 253, 252, 251, 250, 249, 248, 247, 246, 245, 244, 243, 242, 241, 240]

#some files from caixin's articles already have been deleted because it wasn't possible to download them properly, let's find them

le_chemin_art = 'cleaned_articles'  # write the cleaned articles folder path

filenames = os.listdir(le_chemin_art)
filenames =  [i[:-4] for i in filenames] #remove file extension to compare them with caixin_id
filenames = [int(i) for i in filenames]
#print(filenames)


deleted = []
there = []

for i in caixin_id:
    if int(i) in filenames :
        there.append(i)
    else:
        deleted.append(i)

print("here are the files present : ", there)

print("HERE ARE THE DELETED FILES : ", deleted) # deleted = [3912, 3910, 3909, 3908, 3907, 3905, 3904, 2721, 1202, 266]


#now, the first 13 lines repeat themselves, let's get rid of them first

def del_fin(text, there=re.compile(re.escape('此文限时免费阅读感谢')+'.*')): #def function to delete end of line after '此文限时免费阅读感谢'
  return there.sub('', text)

for i in there:  # for all file names in list 'there'
    with open(f'cleaned_articles/{i}.txt', 'r') as f:
        lines = f.readlines() #take the text in the file line by line

    with open(f'clean2/{i}.txt', 'w') as f:

        for number, line in enumerate(lines):
            line = del_fin(line)

            if re.match('分享到微信朋友圈上', line): #stop to write if line starts with '分享到微信朋友圈上' (the ends of the articles are all similar)
                break
            elif number not in (list(range(13))): #skip the first 13 lines
                f.writelines(line) #write only the lines that we want to keep



"""with open(f'clean2/240.txt', r) as f:
    data = f.read()


def del_fin(text, there=re.compile(re.escape('分享到微信朋友圈上')+'.*')):
  return there.sub('', text)


le_chemin_clean2 = 'clean2'  # write the 2nd cleaned articles folder path

filenames2 = os.listdir(le_chemin_clean2)

#create folder for results
if not os.path.exists('clean3'):
    os.makedirs('clean3')"""





"""



for i in there:  # for all file names in list 'there'
    with open(f'cleaned_articles/{i}.txt', 'r') as f:
        lines = f.readlines() #take the text in the file

    with open(r'clean2/{i}.txt', 'w') as fp:
    # iterate each line
        for number, line in enumerate(lines):
            if number not in (list(range(13))):
                fp.write(line)
    #caixin.append(data)

            with open(f'cleaned_articles/{namefile}.txt', 'w') as f:
                f.write(data)







file_path = os.path.join(le_chemin_sub, filename)  # Create path with folder path and file names

        print(file_path) #to check if the order is correct
        with open(file_path, 'r') as f2:
            data = f2.read() #take the text in the file

        texts_list.append(data)  # add it to the list


            with open(f'cleaned_articles/{namefile}.txt', 'w') as f:
                f.write(data)"""
