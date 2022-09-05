import os
import re

def del_fin(text, there=re.compile(re.escape('此文限时免费阅读感谢')+'.*')):
  return there.sub('', text)

with open(f'clean2/240.txt', 'r') as f:
    lines = f.readlines()


for line in lines:

    String.split('分享到微信朋友圈上',1)[0]


    line = del_fin(line)

    if re.match('分享到微信朋友圈上', line):
        break
    print(line)


"""    number not in (list(range(13))):
                fp.write(line)



def del_fin(text, there=re.compile(re.escape('分享到微信朋友圈上')+'.*')):
  return there.sub('', text)

x = del_fin(data)
print('FINAL RESULT OYEAH', x)



for i in there:  # for all file names in list 'there'
    with open(f'cleaned_articles/{i}.txt', 'r') as f:
        lines = f.readlines() #take the text in the file

    with open(r'clean2/{i}.txt', 'w') as fp:
    # iterate each line
        for number, line in enumerate(lines):
            if number not in (list(range(13))):
                fp.write(line)"""
