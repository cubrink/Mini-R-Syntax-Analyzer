#!/bin/bash

bash build.sh

input_directory="./sample_input"
output_directory="./my_outputs"
sample_output_directory="./sample_output"

mkdir -p "$output_directory"

for in_file in $(ls "$input_directory/");
do
    echo "Testing input $in_file"
    out_file="$output_directory/$in_file.out"
    ./parser <$input_directory/$in_file >$out_file

    meld "$sample_output_directory/$in_file.out" "$output_directory/$in_file.out"
done
