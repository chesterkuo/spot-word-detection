#!/bin/bash
python tensorflow/tensorflow/examples/speech_commands/label_wav.py --graph=./output-trained-low-latency_conv/low_latency_conv_frozen_260000_graph.pb --labels=./output-trained-low-latency_conv/low_latency_conv_labels.txt --wav="$1"
