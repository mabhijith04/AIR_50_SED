import os
import sys

delta_block = str(sys.argv[1])+'.txt'

delta_files_dir = './output_Likelihood/'

new_uttid_file = open(delta_files_dir+delta_block,'r')
new_uttids = new_uttid_file.read().split('\n')
new_uttid_file.close()

tr_uttid_file = open('data/local/data/train.uttids','r')
train_uttids = tr_uttid_file.read().split('\n')
tr_uttid_file.close()

new_uttids.remove('')
new_uttids.sort()

train_uttids.remove('')
train_uttids.sort()

for item in new_uttids:
    train_uttids.append(item)

train_uttids.sort()

new_tr_file = open('data/local/data/train.uttids','w')
for item in train_uttids:
    new_tr_file.write(item+'\n')
new_tr_file.close()
