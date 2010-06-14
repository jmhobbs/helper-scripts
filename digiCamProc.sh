#!/bin/bash

# Digital camera thumbnail/contact sheet tool.
# http://www.velvetcache.org/2009/03/30/imagemagick-thumbnails-and-contact-sheets
# http://github.com/jmhobbs/helper-scripts
#
# Copyright (c) 2009-2010 John Hobbs
#
# Permission is hereby granted, free of charge, to any person
# obtaining a copy of this software and associated documentation
# files (the "Software"), to deal in the Software without
# restriction, including without limitation the rights to use,
# copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following
# conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
# OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
# WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.

# CHANGELOG
# 2010-06-14 - Fixed contact sheet problem, thanks to Glenn Turnbull. (John Hobbs)
# 2009-03-30 - Created script. (John Hobbs)

### SETTINGS ###

# Scaling Methods:
# resize (Best/Slow)
# scale (Middle/Middle)
# sample (Worst/Fast)
METHOD="sample"

# Thumbnail Size
THUMBSIZE="600x600"
# Thumbnail Directory
THUMBDIR="thumb"
# Thumbnail Quality
THUMBQUALITY="80"

# Contact Item Size
CONTACTSIZE="200x200"
# Contact Sheet Max Width
CONTACTWIDTH="3"
# Contact Sheet Max Height
CONTACTHEIGHT="4"
# Horizontal Spacing
CONTACTSPACINGH="3"
# Vertical Spacing
CONTACTSPACINGV="3"
# Contact Sheet Directory
CONTACTDIR="contact"
# Contact Sheet Quality
CONTACTQUALITY="100"

################


CONTACTCOUNT=$(($CONTACTWIDTH * $CONTACTHEIGHT))
PIX=$(ls -l *.jpg | wc -l)

echo "Processing $PIX Images"
echo
echo "Creating Thumbnails"

mkdir -p $THUMBDIR
CTR=0
echo -n "0%"
for i in *.jpg; do
	echo -ne "\r"
	echo -n "$((100 * $CTR / $PIX))%"
	convert -strip -quality ${THUMBQUALITY} -${METHOD} ${THUMBSIZE} "$i" "${THUMBDIR}/${i}"
	CTR=$(($CTR + 1))
done

echo -ne "\r"
echo "100%"

echo
echo "Creating Contact Sheets"

mkdir -p $CONTACTDIR
CTR=0
PAGES=$(($PIX / $CONTACTCOUNT))
if [ $(($PIX % $CONTACTCOUNT)) -ne 0 ]; then
	PAGES=$(($PAGES + 1))
fi

PAGE=1
LIST=""
for i in ${THUMBDIR}/*.jpg; do
	if [ $(($CTR % $CONTACTCOUNT)) -eq 0 ] && [ $CTR -ne 0 ]; then
		echo "$PAGE of $PAGES"
		montage -label %f -quality $CONTACTQUALITY -frame 5 -tile ${CONTACTWIDTH}x${CONTACTHEIGHT} -geometry ${CONTACTSIZE}+${CONTACTSPACINGH}+${CONTACTSPACINGV} $LIST jpg:- > ${CONTACTDIR}/${PAGE}.jpg
		LIST=""
		PAGE=$(($PAGE + 1))
	fi
	LIST="$LIST $i"
	CTR=$(($CTR + 1))
done

if [ "" != "$LIST" ]; then
	echo "$PAGE of $PAGES"
	montage -label %f -quality $CONTACTQUALITY -frame 5 -tile ${CONTACTWIDTH}x${CONTACTHEIGHT} -geometry ${CONTACTSIZE}+${CONTACTSPACINGH}+${CONTACTSPACINGV} $LIST jpg:- > ${CONTACTDIR}/${PAGE}.jpg
fi
