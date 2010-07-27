# Helper Scripts

This is a collection of small scripts I've written and collected over the years.  Each does one small thing, and few of them are really full featured tools.

Everything is licensed under the MIT license.

## digiCamProc.sh

**Language:** Bash
**Requirements:** imagemagick
<http://www.velvetcache.org/2009/03/30/imagemagick-thumbnails-and-contact-sheets>

This script will take a bunch of jpg's and create thumbnails and contact sheets for all of them.

**Usage:** ./digiCamProc.sh

## KolorTool

**Language:** Python
**Requirements:** pyqt, pykde
<http://www.velvetcache.org/2009/07/17/kolortool-for-kde-4>

This script pops up a KColorChooser dialog so you can grab and/or mix up new colors.

**Usage:** ./KolorTool

## any2mp3.sh

**Language:** Bash
**Requirements:** mplayer, lame
<http://www.velvetcache.org/2008/03/18/any2mp3>

This script will take any set of audio files that mplayer can decode and re-encode them as MP3 files.

**Usage:** ./any2mp3.sh m4a

## compressAudioBooks.sh

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