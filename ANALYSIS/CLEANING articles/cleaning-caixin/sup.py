import os
import re


with open(f'clean2/240.txt', 'r') as f:
    data = f.read()
print('DATA IS THAT : ', data)


def del_fin(text, there=re.compile(re.escape('分享到微信朋友圈上')+'.*')):
  return there.sub('', text)

x = del_fin(data)
print('FINAL RESULT OYEAH', x)
