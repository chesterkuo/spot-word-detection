#!/bin/bash

out=sample_submission-chester20171121.csv
shopt -s globstar
echo "fname,label" > $out
for i in ./test/**/*
do
      if [ -f $i ]
      then
          file=$(basename $i)
          echo $file
          label=`python /sdc1/git/tensorflow-v1.4-speech-example/tensorflow/tensorflow/examples/speech_commands/label_wav.py --graph=/sdc1/git/tensorflow-v1.4-speech-example/output-trained-low-latency_svdf/low_latency_svdf_frozen_700000-graph.pb --labels=/sdc1/git/tensorflow-v1.4-speech-example/output-trained-low-latency_svdf/low_latency_svdf_labels.txt --how_many_labels=1 --wav=$i`
          result=`echo $label | awk '{print $1}'`
          echo "$file,$result" >> $out 
      fi 
done
