#!/bin/bash

#GIVE ALL SHELL SCRIPTS EXECUTABLE PERMISSION IN STARTING

export USER=$(whoami)

iter_num=$1

recipe_name="AIR_loop_noise50_${iter_num}"

cp -a ~/kaldi/egs/timit ~/kaldi/egs/$recipe_name

rm ~/kaldi/egs/$recipe_name/s5/run.sh
cp -a Recipe_Files/run.sh ~/kaldi/egs/$recipe_name/s5/run.sh

rm ~/kaldi/egs/$recipe_name/s5/cmd.sh
cp -a Recipe_Files/cmd.sh ~/kaldi/egs/$recipe_name/s5/cmd.sh

rm ~/kaldi/egs/$recipe_name/s5/local/timit_prepare_dict.sh
cp -a Recipe_Files/timit_prepare_dict.sh ~/kaldi/egs/$recipe_name/s5/local/timit_prepare_dict.sh

rm ~/kaldi/egs/$recipe_name/s5/local/timit_format_data.sh
cp -a Recipe_Files/timit_format_data.sh ~/kaldi/egs/$recipe_name/s5/local/timit_format_data.sh

rm ~/kaldi/egs/$recipe_name/s5/steps/make_mfcc.sh
cp -a Recipe_Files/make_mfcc.sh ~/kaldi/egs/$recipe_name/s5/steps/make_mfcc.sh

rm ~/kaldi/egs/$recipe_name/s5/local/nnet/run_dnn.sh
cp -a Recipe_Files/run_dnn.sh ~/kaldi/egs/$recipe_name/s5/local/nnet/run_dnn.sh

cp -a Recipe_Files/local_custom ~/kaldi/egs/$recipe_name/s5/local_custom
cp -a Recipe_Files/Python_Files ~/kaldi/egs/$recipe_name/s5/Python_Files
cp -a Recipe_Files/steps_fa ~/kaldi/egs/$recipe_name/s5/steps_fa
cp -a Recipe_Files/output_Likelihood ~/kaldi/egs/$recipe_name/s5/output_Likelihood
cp -a Recipe_Files/utils_custom ~/kaldi/egs/$recipe_name/s5/utils_custom

data_dir=~/kaldi/egs/$recipe_name/s5/data/local/data
dict_dr=~/kaldi/egs/$recipe_name/s5/data/local/dict

mkdir -p $data_dir $dict_dir

cp -a Recipe_Files/uttids/train.uttids ~/kaldi/egs/$recipe_name/s5/data/local/data/train.uttids
cp -a Recipe_Files/uttids/test.uttids ~/kaldi/egs/$recipe_name/s5/data/local/data/test.uttids
cp -a Recipe_Files/uttids/dev.uttids ~/kaldi/egs/$recipe_name/s5/data/local/data/dev.uttids

cp -a Recipe_Files/run_iter.sh ~/kaldi/egs/$recipe_name/s5/run_iter.sh

echo "New recipe - $recipe_name created successfully with all appropriate files replaced!!!"

cd ~/kaldi/egs/$recipe_name/s5/

./run_iter.sh $iter_num
