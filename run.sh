#!/usr/bin/env bash

find dataset -type f -not -name "*.jpg" -delete

for f in dataset/*.jpg; do convert $f -crop 468x80+230+914 $f.cropped; done

for f in dataset/*.jpg.cropped; do convert $f -resize 1x1\! -format "%[fx:int(255*r+.5)],%[fx:int(255*g+.5)],%[fx:int(255*b+.5)]\n" info:- > $f.color; done

for f in dataset/*.color; do ./binarize.rb $f > $f.binarized; done

for f in dataset/*.jpg.cropped; do convert $f -grayscale Brightness $(cat $f.color.binarized) $f.processed; done

for f in dataset/*.processed; do tesseract $f $f --psm 11; done

./mass-find-match.rb "dataset/*.txt"

./page.rb > index.html
