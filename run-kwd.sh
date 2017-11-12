#!/bin/bash
python kwd_wav.py --graph=./output-trained-low-latency_conv/low_latency_conv_frozen_260000_graph.pb --labels=./output-trained-low-latency_conv/low_latency_conv_labels.txt --wav="$1" --kwd="$2"
