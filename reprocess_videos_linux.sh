#!/bin/bash

# This is a bash script to downsample (reduce), crop and convert *.mp4 files to *.avi format
# Locate this script in the folder where *.mp4 files are located
# This version of the script is for Linux users
# The script can be executed on Windows as well if appropriate software for bash execution is installed (consider, for example, Git Bash as an option). 

# To activate or deactivate a certain preprocessing step remove "#"-sign prior to ffmpeg command below 
# Make sure that ffmpeg software is installed. It also should be executable from the command line, otherwise add prior to "ffmpeg" command the full path to where ffmpeg software is located.

# DEFINE THESE PARAMETERS and test the script (it is recommended to use a short video for the test)

take_each_n_frame=200 
width=1288 
height=600
X=0
Y=200


mkdir reduce
mkdir crop
mkdir avi

for filename in ./*.mp4; do
    ffmpeg -i $filename -vf "select=not(mod(n\,$take_each_n_frame))" -vsync vfr -q:v 2 reduce/$filename
    ffmpeg -i reduce/$filename -filter:v "crop=$width:$height:$X:$Y" -c:a copy crop/$filename
    ffmpeg -i crop/$filename -pix_fmt nv12 -f avi -vcodec rawvideo avi/$filename.avi
done


