#!/bin/bash

. ./cmd.sh
[ -f path.sh ] && . ./path.sh
set -e

AIR_dataset_dir=$1
AIR_recipe_dir=`pwd`

data_dir=data/local/data
dict_dir=data/local/dict

mkdir -p $dict_dir

python3 Python_Files/kaldi_file_preparation.py $AIR_dataset_dir $AIR_recipe_dir $data_dir $dict_dir

echo "Data preparation done successfully!!!"
