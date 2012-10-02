#!/bin/bash

# Script to KDE power manager, triggered when switching from AC to bettery.
# We disable compsiting if it is on.

if [ "true" == "$(qdbus org.kde.kwin /KWin org.kde.KWin.compositingActive)" ]; then
	qdbus org.kde.kwin /KWin org.kde.KWin.toggleCompositing
fi
