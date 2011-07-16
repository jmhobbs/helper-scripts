#!/bin/bash

#
# This script is used to scale and orient photos from our D90
# in a format that works better with Gallery2
#
# Since Gallery2 doesn't respect EXIF rotation data, we fix that here
# We also scale it down for faster upload.
#

rename s/.JPG/.jpg/ *
mkdir -p resized
for i in *.jpg; do
	echo $i
	convert -auto-orient -resize 1024x1024 $i resized/$i
done
