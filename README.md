# Helper Scripts

This is a collection of small scripts I've written and collected over the years.  Each does one small thing, and few of them are really full featured tools.

Everything is licensed under the MIT license.

## phlint

**Language:** Python

**Requirements:** php

A mutli-process PHP linter, using <tt>php -l</tt>.  It takes the number of cores you have and spins up that many processes to run through all the PHP files it finds in the directory you provide (or CWD).

**Usage:**  ./phlint my-php-files/

### Why?

Using multiple processes speeds things up.  Here's and example run on my
machine.

    jmhobbs@Cordelia$ time `for i in $(find . -iname '*.php'); do php -l $i; done`
    real1m19.004s
    user0m44.643s
    sys0m30.570s
    jmhobbs@Cordelia$ time phlint
    ==> Checking 1640 files with 8 cores, chunksize 205
    
    real0m13.912s
    user0m59.512s
    sys0m36.158s
    jmhobbs@Cordelia$ 

It's over a minute better in wall clock time.

## clone-website

**Language:** bash

**Requirements:** wget, sed, awk

This script takes a URL and downloads everything you need to mirror it.

**Usage:** ./clone-website http://www.velvetcache.org/

## any2mp3

**Language:** Bash

**Requirements:** mplayer, lame

<http://www.velvetcache.org/2008/03/18/any2mp3>

This script will take any set of audio files that mplayer can decode and re-encode them as MP3 files.

**Usage:** ./any2mp3.sh m4a

## compress-audio-books

**Language:** Bash

**Requirements:** lame

This script recompresses audio book MP3 files at 64k bitrate. Smush 'em to fit on a mobile device.

**Usage:** ./compressAudioBooks.sh

## ScreenSaverOn

**Language:** sh

**Requirements:** KDE, QDBus

This script will turn on your screen saver in KDE.

**Usage:** ./ScreenSaverOn

## ScreenSaverOnAndMonitorOff

**Language:** sh

**Requirements:** KDE, QDBus, xset

This script will turn on your screen saver in KDE, then turn your monitor off.

**Usage:** ./ScreenSaverOnAndMonitorOff

## mkpwd

**Language:** sh

**Requirements:** /dev/urandom, base64

Generate a password string (72 chars).  If you want a shorter one pipe it through:

    $ mkpwd | head -c 10
    a7+hsy182n

