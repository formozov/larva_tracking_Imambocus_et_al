#!/bin/bash

# This is a bash script to downsample (reduce), crop and convert *.mp4 files to *.avi format
# Locate this script in the folder where *.mp4 files are located
# This version of the script is for Linux users
# The script can be executed on Windows as well if appropriate software for bash execution is installed (consider, for example, Git Bash as an option). 

# To activate or deactivate a certain preprocessing step remove "#"-sign prior to ffmpeg command below 
# Make sure that ffmpeg software is installed. It also should be executable from the command line, otherwise add prior to "ffmpeg" command the full path to where ffmpeg software is located.

mkdir reduce
mkdir crop
mkdir avi

for filename in ./*.mp4; do
    ffmpeg -i $filename -vf "select=not(mod(n\,200))" -vsync vfr -q:v 2 reduce/$filename
    ffmpeg -i reduce/$filename -filter:v "crop=2048:1000:0:550" -c:a copy crop/$filename
    ffmpeg -i reduce/$filename -pix_fmt nv12 -f avi -vcodec rawvideo avi/$filename.avi
done


