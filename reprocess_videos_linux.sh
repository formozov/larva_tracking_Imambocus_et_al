#!/bin/bash

mkdir reduce
mkdir crop
mkdir avi

for filename in ./*.mp4; do
    ffmpeg -i $filename -vf "select=not(mod(n\,200))" -vsync vfr -q:v 2 reduce/$filename
    ffmpeg -i reduce/$filename -filter:v "crop=2048:1000:0:550" -c:a copy crop/$filename
    ffmpeg -i crop/$filename -pix_fmt nv12 -f avi -vcodec rawvideo avi/$filename.avi
done


