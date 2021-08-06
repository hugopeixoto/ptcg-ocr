rm dataset/*.cropped
rm dataset/*.txt
rm dataset/*.processed
rm dataset/*.best-entry
for f in dataset/*.jpg; do convert $f -crop 468x80+230+914 -grayscale Brightness -threshold 60% $f.processed; done
for f in dataset/*.jpg; do convert $f -crop 468x80+230+914 $f.cropped; done
for f in dataset/*.processed; do tesseract $f $f --psm 11; done
for f in dataset/*.txt; do ./find-match.rb $f; done
