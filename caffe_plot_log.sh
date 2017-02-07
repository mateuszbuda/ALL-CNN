#!/bin/bash
#
# usage example: ./caffe_plot_log.sh accuracy ALL_CNN_C.log
#

if [ "${1}" == "loss" ]; then
	D=5
elif [ "${1}" == "accuracy" ]; then
	D=4
else
	echo "First argument should be either loss or accuracy"
	exit 1
fi


# generate csv files from log

DIR=$(dirname "${2}")

python2 $CAFFE_ROOT/tools/extra/parse_log.py $2 ${DIR}


# plot

train_file=${2}.train
test_file=${2}.test

# linux version:
#gnuplot_cmd="set key left top; set datafile separator ','; plot '${train_file}' using 1:${D} with line title '${1} train', '${test_file}' using 1:${D} with line title '${1} test';"
# osx to display (requires `brew install gnuplot --with-x11`):
#gnuplot_cmd="set terminal x11; set key left top; set datafile separator ','; plot '${train_file}' using 1:${D} with line title '${1} train', '${test_file}' using 1:${D} with line title '${1} test';"
# osx to save to accuracy.png file:
gnuplot_cmd="set terminal png; set output \"./${1}.png\"; set key left top; set datafile separator ','; plot '${train_file}' using 1:${D} with line title '${1} train', '${test_file}' using 1:${D} with line title '${1} test';"

gnuplot -p -e "${gnuplot_cmd}" 


unset D
exit 0

