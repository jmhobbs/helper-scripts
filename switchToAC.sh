#!/bin/bash

# Script to KDE power manager, triggered when switching from battery to AC
# We re-enable compsiting if it is off.

if [ "false" == "$(qdbus org.kde.kwin /KWin org.kde.KWin.compositingActive)" ]; then
	qdbus org.kde.kwin /KWin org.kde.KWin.toggleCompositing
fi
