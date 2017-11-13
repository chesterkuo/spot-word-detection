# Here is repository and example to use Tensorflow framework for KeyWord detection
[ Based on idea of https://github.com/tensorflow/tensorflow/tree/master/tensorflow/examples/speech_commands ]

### (A) Create virtualenv of python, this can help us to use package we only needs.

$ **virtualenv tensorflow-v1.4.0**
New python executable in /sda/virtualenv/tensorflow-v1.4.0/bin/python
Installing setuptools, pip, wheel...done.
$ **source tensorflow-v1.4.0/bin/activate**
(tensorflow-v1.4.0)$ pip install tensorflow
Collecting tensorflow
  Downloading tensorflow-1.4.0-cp27-cp27mu-manylinux1_x86_64.whl (40.7MB)
  
$ **pip list --format=columns**
###### PIP Package                Version
---------------------- ---------
backports.weakref      1.0.post1
bleach                 1.5.0
enum34                 1.1.6
funcsigs               1.0.2
futures                3.1.1
html5lib               0.9999999
Markdown               2.6.9
mock                   2.0.0
numpy                  1.13.3
pbr                    3.1.1
pip                    9.0.1
protobuf               3.4.0
setuptools             36.7.1
six                    1.11.0
tensorflow             1.4.0
tensorflow-tensorboard 0.4.0rc2
Werkzeug               0.12.2
wheel                  0.30.0| column | column |



(tensorflow-v1.4.0) $ **git clone https://github.com/tensorflow/tensorflow.git**
Cloning into 'tensorflow'...
remote: Counting objects: 260227, done.
remote: Compressing objects: 100% (4/4), done.
remote: Total 260227 (delta 29), reused 29 (delta 29), pack-reused 260194
Receiving objects: 100% (260227/260227), 130.73 MiB | 9.18 MiB/s, done.
Resolving deltas: 100% (203118/203118), done.
Checking connectivity... done.
(tensorflow-v1.4.0) $ **cd tensorflow/**
(tensorflow-v1.4.0) $ **git checkout -b v1.4.0**
Switched to a new branch 'v1.4.0'
(tensorflow-v1.4.0) $ **git branch**
  master
* v1.4.0


### (B) Install Bazel package, skip this if you don't need to build tensorflow program or package yourslef.
https://docs.bazel.build/versions/master/install-ubuntu.html


(tensorflow-v1.4.0) $ ./**bazel-0.6.1-installer-linux-x86_64.sh --user**
Bazel installer
---------------

Bazel is bundled with software licensed under the GPLv2 with Classpath exception.
You can find the sources next to the installer on our release page:
   https://github.com/bazelbuild/bazel/releases

# Release 0.6.1 (2017-10-05)

Baseline: 87cc92e5df35d02a7c9bc50b229c513563dc1689

Cherry picks:
   + a615d288b008c36c659fdc17965207bb62d95d8d:
     Rollback context.actions.args() functionality.
   + 7b091c1397a82258e26ab5336df6c8dae1d97384:
     Add a global failure when a test is interrupted/cancelled.
   + 95b0467e3eb42a8ce8d1179c0c7e1aab040e8120:
     Cleanups for Skylark tracebacks
   + cc9c2f07127a832a88f27f5d72e5508000b53429:
     Remove the status xml attribute from AntXmlResultWriter
   + 471c0e1678d0471961f1dc467666991e4cce3846:
     Release 0.6.0 (2017-09-28)
   + 8bdd409f4900d4574667fed83d86b494debef467:
     Only compute hostname once per server lifetime
   + 0bc9b3e14f305706d72180371f73a98d6bfcdf35:
     Fix bug in NetUtil caching.

Important changes:
 - Only compute hostname once per server lifetime

## Build informations
   - [Commit](https://github.com/bazelbuild/bazel/commit/b9f88e5)
Uncompressing......Extracting Bazel installation...
.

Bazel is now installed!

Make sure you have "/home/chester/bin" in your path. You can also activate bash
completion by adding the following line to your ~/.bashrc:
  source /home/chester/.bazel/bin/bazel-complete.bash

See http://bazel.build/docs/getting-started.html to start a new project!


### (C) Train tensorflow with speech Dataset

(tensorflow-v1.4.0) $ .**/run-train-with-mode-low_latency_conv.sh**
2017-11-11 21:38:48.455364: I tensorflow/core/platform/cpu_feature_guard.cc:137] Your CPU supports instructions that this TensorFlow binary was not compiled to use: SSE4.1 SSE4.2 AVX AVX2 FMA
>> Downloading speech_commands_v0.01.tar.gz 100.0%
INFO:tensorflow:Successfully downloaded speech_commands_v0.01.tar.gz (1488293908 bytes)
WARNING:tensorflow:From tensorflow/tensorflow/examples/speech_commands/train.py:163: get_or_create_global_step (from tensorflow.contrib.framework.python.ops.variables) is deprecated and will be removed in a future version.
Instructions for updating:
Please switch to tf.train.get_or_create_global_step
INFO:tensorflow:Training from step: 1
INFO:tensorflow:Step #1: rate 0.010000, accuracy 16.0%, cross entropy 1.611098
INFO:tensorflow:Step #2: rate 0.010000, accuracy 18.0%, cross entropy 1.610541
INFO:tensorflow:Step #3: rate 0.010000, accuracy 27.0%, cross entropy 1.610142
INFO:tensorflow:Step #4: rate 0.010000, accuracy 28.0%, cross entropy 1.609196
INFO:tensorflow:Step #5: rate 0.010000, accuracy 25.0%, cross entropy 1.608746
INFO:tensorflow:Step #6: rate 0.010000, accuracy 28.0%, cross entropy 1.608680
INFO:tensorflow:Step #13: rate 0.010000, accuracy 32.0%, cross entropy 1.605930



### (D) After network be trained, it will generate file include meta graph, checkpoint and variables under folder name ,"output-trained-low-latency_conv", then try to freeze the network to pb file.

(tensorflow-v1.4.0) $ **ls -lh output-trained-low-latency_conv/**
total 7.5M
-rw-rw-r-- 1 chester chester  787 十一 12 22:34 checkpoint
-rw-rw-r-- 1 chester chester 3.7M 十一 12 22:34 low_latency_conv.ckpt-260000.data-00000-of-00001
-rw-rw-r-- 1 chester chester  370 十一 12 22:34 low_latency_conv.ckpt-260000.index
-rw-rw-r-- 1 chester chester  85K 十一 12 22:34 low_latency_conv.ckpt-260000.meta
-rw-rw-r-- 1 chester chester 3.7M 十一 12 22:35 low_latency_conv_frozen_260000_graph.pb
-rw-rw-r-- 1 chester chester   60 十一 12 22:34 low_latency_conv_labels.txt
-rw-rw-r-- 1 chester chester 140K 十一 12 22:34 low_latency_conv.pbtxt

 (tensorflow-v1.4.0) $ ./**run-freeze-with-mode-low_latency_conv.sh**
2017-11-12 22:35:02.468222: I tensorflow/core/platform/cpu_feature_guard.cc:137] Your CPU supports instructions that this TensorFlow binary was not compiled to use: SSE4.1 SSE4.2 AVX AVX2 FMA
Converted 8 variables to const ops.



### (E) Run inference with specific wav file, wav file need to be with 16000 sample rate, single channel, PCM

(tensorflow-v1.4.0) $ ./**run-inference.sh ./download-speech-data/left/6f342826_nohash_0.wav**
2017-11-12 22:43:42.029269: I tensorflow/core/platform/cpu_feature_guard.cc:137] Your CPU supports instructions that this TensorFlow binary was not compiled to use: SSE4.1 SSE4.2 AVX AVX2 FMA
left (score = 0.88148)
right (score = 0.11090)
_unknown_ (score = 0.00413)


(tensorflow-v1.4.0) $ ./**run-inference.sh ./download-speech-data/yes/39a12648_nohash_0.wav**
2017-11-12 22:44:26.503044: I tensorflow/core/platform/cpu_feature_guard.cc:137] Your CPU supports instructions that this TensorFlow binary was not compiled to use: SSE4.1 SSE4.2 AVX AVX2 FMA
yes (score = 0.85850)
no (score = 0.09289)
down (score = 0.04094)


(tensorflow-v1.4.0) $ ./**run-inference.sh ./download-speech-data/sheila/d37e4bf1_nohash_0.wav**
2017-11-12 22:44:49.766790: I tensorflow/core/platform/cpu_feature_guard.cc:137] Your CPU supports instructions that this TensorFlow binary was not compiled to use: SSE4.1 SSE4.2 AVX AVX2 FMA
_unknown_ (score = 0.99235)
stop (score = 0.00346)
yes (score = 0.00319)


### (F) Use python to detect specific words you want to check of wav file, please keep in mind , the keyword list need to be in trainning dataset.


(tensorflow-v1.4.0) $ ./**run-kwd.sh ./myrecord-yes.wav yes**
2017-11-12 23:25:46.077154: I tensorflow/core/platform/cpu_feature_guard.cc:137] Your CPU supports instructions that this TensorFlow binary was not compiled to use: SSE4.1 SSE4.2 AVX AVX2 FMA
 kwd matched

(tensorflow-v1.4.0) $ ./**run-kwd.sh ./myrecord-yes.wav no**
2017-11-12 23:25:52.996674: I tensorflow/core/platform/cpu_feature_guard.cc:137] Your CPU supports instructions that this TensorFlow binary was not compiled to use: SSE4.1 SSE4.2 AVX AVX2 FMA

### (G) File list need for inference
File size of freeze graph file :
**3.7M**  output-trained-low-latency_conv/low_latency_conv_frozen_260000_graph.pb


### **(H) Amazon AVS integration**
(To be added into AVS SDK)
https://github.com/alexa/avs-device-sdk

