#!/bin/sh
#
# This file is part of plata-theme
#
# Copyright (C) 2018-2019 Tista <tista.gma500@gmail.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#

###############
# Print usage #
###############

# Usage: ./parse-sass.sh [ -a ]
#
# Optional arguments:
#    -a        generates CSSs for all of Gtk versioned

usage() {
    sed -rn '/^# Usage/,${/^#/!q;s/^# ?//;p}' "$0"
}

if [ "$1" = '-h' ] || [ "$1" = '--help' ] || [ "$1" = 'help' ]; then
    usage
    exit 1
fi

#########################
# Check Gtk-3.0 version #
#########################

PKG_CONFIG="`command -v pkg-config`"

# evenize minor version number of gtk-3.0
major="`$PKG_CONFIG --modversion gtk+-3.0 | cut -d. -f1`"
minor="`$PKG_CONFIG --modversion gtk+-3.0 | cut -d. -f2`"
if [ $(expr "$minor" % 2) -ne 0 ]; then
    css_minor="$(expr $minor + 1)"
else
    css_minor="$minor"
fi

if [ ! -d ./"$major"."$css_minor" ]; then
    echo version "$major"."$minor".x is not supported.
    exit 1
fi

#################
# Generate CSSs #
#################

SASSC="`command -v sassc` -M -t compact"

case "$1" in
    -a)
        if [ ! -d ../gtk-3.20 ]; then
            mkdir -p ../gtk-3.20 ../gtk-3.20-compact
        fi
        if [ ! -d ../gtk-3.20-light ]; then
            mkdir -p ../gtk-3.20-light ../gtk-3.20-light-compact
        fi
        if [ ! -d ../gtk-3.20-dark ]; then
            mkdir -p ../gtk-3.20-dark ../gtk-3.20-dark-compact
        fi
        $SASSC 3.20/gtk-light.scss ../gtk-3.20-light/gtk-contained.css
        $SASSC 3.20/gtk-dark.scss ../gtk-3.20-dark/gtk-contained-dark.css
        $SASSC 3.20/gtk-mixed.scss ../gtk-3.20/gtk-contained.css
        cp -f ../gtk-3.20-dark/gtk-contained-dark.css ../gtk-3.20-light/gtk-contained-dark.css
        cp -f ../gtk-3.20-dark/gtk-contained-dark.css ../gtk-3.20/gtk-contained-dark.css

        $SASSC 3.20/gtk-light-compact.scss ../gtk-3.20-light-compact/gtk-contained.css
        $SASSC 3.20/gtk-dark-compact.scss ../gtk-3.20-dark-compact/gtk-contained-dark.css
        $SASSC 3.20/gtk-mixed-compact.scss ../gtk-3.20-compact/gtk-contained.css
        cp -f ../gtk-3.20-dark-compact/gtk-contained-dark.css ../gtk-3.20-light-compact/gtk-contained-dark.css
        cp -f ../gtk-3.20-dark-compact/gtk-contained-dark.css ../gtk-3.20-compact/gtk-contained-dark.css

        if [ ! -d ../gtk-3.22 ]; then
            mkdir -p ../gtk-3.22 ../gtk-3.22-compact
        fi
        if [ ! -d ../gtk-3.22-light ]; then
            mkdir -p ../gtk-3.22-light ../gtk-3.22-light-compact
        fi
        if [ ! -d ../gtk-3.22-dark ]; then
            mkdir -p ../gtk-3.22-dark ../gtk-3.22-dark-compact
        fi
        $SASSC 3.22/gtk-light.scss ../gtk-3.22-light/gtk-contained.css
        $SASSC 3.22/gtk-dark.scss ../gtk-3.22-dark/gtk-contained-dark.css
        $SASSC 3.22/gtk-mixed.scss ../gtk-3.22/gtk-contained.css
        cp -f ../gtk-3.22-dark/gtk-contained-dark.css ../gtk-3.22-light/gtk-contained-dark.css
        cp -f ../gtk-3.22-dark/gtk-contained-dark.css ../gtk-3.22/gtk-contained-dark.css

        $SASSC 3.22/gtk-light-compact.scss ../gtk-3.22-light-compact/gtk-contained.css
        $SASSC 3.22/gtk-dark-compact.scss ../gtk-3.22-dark-compact/gtk-contained-dark.css
        $SASSC 3.22/gtk-mixed-compact.scss ../gtk-3.22-compact/gtk-contained.css
        cp -f ../gtk-3.22-dark-compact/gtk-contained-dark.css ../gtk-3.22-light-compact/gtk-contained-dark.css
        cp -f ../gtk-3.22-dark-compact/gtk-contained-dark.css ../gtk-3.22-compact/gtk-contained-dark.css

        if [ ! -d ../gtk-3.24 ]; then
            mkdir -p ../gtk-3.24 ../gtk-3.24-compact
        fi
        if [ ! -d ../gtk-3.24-light ]; then
            mkdir -p ../gtk-3.24-light ../gtk-3.24-light-compact
        fi
        if [ ! -d ../gtk-3.24-dark ]; then
            mkdir -p ../gtk-3.24-dark ../gtk-3.24-dark-compact
        fi
        $SASSC 3.24/gtk-light.scss ../gtk-3.24-light/gtk-contained.css
        $SASSC 3.24/gtk-dark.scss ../gtk-3.24-dark/gtk-contained-dark.css
        $SASSC 3.24/gtk-mixed.scss ../gtk-3.24/gtk-contained.css
        cp -f ../gtk-3.24-dark/gtk-contained-dark.css ../gtk-3.24-light/gtk-contained-dark.css
        cp -f ../gtk-3.24-dark/gtk-contained-dark.css ../gtk-3.24/gtk-contained-dark.css

        $SASSC 3.24/gtk-light-compact.scss ../gtk-3.24-light-compact/gtk-contained.css
        $SASSC 3.24/gtk-dark-compact.scss ../gtk-3.24-dark-compact/gtk-contained-dark.css
        $SASSC 3.24/gtk-mixed-compact.scss ../gtk-3.24-compact/gtk-contained.css
        cp -f ../gtk-3.24-dark-compact/gtk-contained-dark.css ../gtk-3.24-light-compact/gtk-contained-dark.css
        cp -f ../gtk-3.24-dark-compact/gtk-contained-dark.css ../gtk-3.24-compact/gtk-contained-dark.css

        if [ ! -d ../gtk-4.0 ]; then
            mkdir -p ../gtk-4.0 ../gtk-4.0-compact
        fi
        if [ ! -d ../gtk-4.0-light ]; then
            mkdir -p ../gtk-4.0-light ../gtk-4.0-light-compact
        fi
        if [ ! -d ../gtk-4.0-dark ]; then
            mkdir -p ../gtk-4.0-dark ../gtk-4.0-dark-compact
        fi
        $SASSC 4.0/gtk-light.scss ../gtk-4.0-light/gtk-contained.css
        $SASSC 4.0/gtk-dark.scss ../gtk-4.0-dark/gtk-contained-dark.css
        $SASSC 4.0/gtk-mixed.scss ../gtk-4.0/gtk-contained.css
        cp -f ../gtk-4.0-dark/gtk-contained-dark.css ../gtk-4.0-light/gtk-contained-dark.css
        cp -f ../gtk-4.0-dark/gtk-contained-dark.css ../gtk-4.0/gtk-contained-dark.css

        $SASSC 4.0/gtk-light-compact.scss ../gtk-4.0-light-compact/gtk-contained.css
        $SASSC 4.0/gtk-dark-compact.scss ../gtk-4.0-dark-compact/gtk-contained-dark.css
        $SASSC 4.0/gtk-mixed-compact.scss ../gtk-4.0-compact/gtk-contained.css
        cp -f ../gtk-4.0-dark-compact/gtk-contained-dark.css ../gtk-4.0-light-compact/gtk-contained-dark.css
        cp -f ../gtk-4.0-dark-compact/gtk-contained-dark.css ../gtk-4.0-compact/gtk-contained-dark.css

        if [ ! -d ../xfce-notify-4.0 ]; then
            mkdir -p ../xfce-notify-4.0
        fi
        if [ ! -d ../xfce-notify-4.0-light ]; then
            mkdir -p ../xfce-notify-4.0-light
        fi
        if [ ! -d ../xfce-notify-4.0-dark ]; then
            mkdir -p ../xfce-notify-4.0-dark
        fi
        $SASSC xfce-notify/xfce-notify-4.0-mixed.scss ../xfce-notify-4.0/gtk.css
        $SASSC xfce-notify/xfce-notify-4.0-light.scss ../xfce-notify-4.0-light/gtk.css
        $SASSC xfce-notify/xfce-notify-4.0-dark.scss ../xfce-notify-4.0-dark/gtk.css
        ;;
    *)
        if [ ! -d ../gtk-"$major"."$css_minor" ]; then
            mkdir -p ../gtk-"$major"."$css_minor" \
                     ../gtk-"$major"."$css_minor"-compact
        fi
        if [ ! -d ../gtk-"$major"."$css_minor"-light ]; then
            mkdir -p ../gtk-"$major"."$css_minor"-light \
                     ../gtk-"$major"."$css_minor"-light-compact
        fi
        if [ ! -d ../gtk-"$major"."$css_minor"-dark ]; then
            mkdir -p ../gtk-"$major"."$css_minor"-dark \
                     ../gtk-"$major"."$css_minor"-dark-compact
        fi

        $SASSC \
            "$major"."$css_minor"/gtk-mixed.scss ../gtk-"$major"."$css_minor"/gtk-contained.css
        echo Wrote ../gtk-"$major"."$css_minor"/gtk-contained.css
        $SASSC \
            "$major"."$css_minor"/gtk-light.scss ../gtk-"$major"."$css_minor"-light/gtk-contained.css
        echo Wrote ../gtk-"$major"."$css_minor"-light/gtk-contained.css
        $SASSC \
            "$major"."$css_minor"/gtk-dark.scss ../gtk-"$major"."$css_minor"-dark/gtk-contained-dark.css
        echo Wrote ../gtk-"$major"."$css_minor"-dark/gtk-contained-dark.css
        $SASSC \
            "$major"."$css_minor"/gtk-mixed-compact.scss ../gtk-"$major"."$css_minor"-compact/gtk-contained.css
        echo Wrote ../gtk-"$major"."$css_minor"-compact/gtk-contained.css
        $SASSC \
            "$major"."$css_minor"/gtk-light-compact.scss ../gtk-"$major"."$css_minor"-light-compact/gtk-contained.css
        echo Wrote ../gtk-"$major"."$css_minor"-light-compact/gtk-contained.css
        $SASSC \
            "$major"."$css_minor"/gtk-dark-compact.scss ../gtk-"$major"."$css_minor"-dark-compact/gtk-contained-dark.css
        echo Wrote ../gtk-"$major"."$css_minor"-dark-compact/gtk-contained-dark.css

        cp -f ../gtk-"$major"."$css_minor"-dark/gtk-contained-dark.css \
            ../gtk-"$major"."$css_minor"/gtk-contained-dark.css
        echo Copied to ../gtk-"$major"."$css_minor"/gtk-contained-dark.css
        cp -f ../gtk-"$major"."$css_minor"-dark/gtk-contained-dark.css \
            ../gtk-"$major"."$css_minor"-light/gtk-contained-dark.css
        echo Copied to ../gtk-"$major"."$css_minor"-light/gtk-contained-dark.css
        cp -f ../gtk-"$major"."$css_minor"-dark-compact/gtk-contained-dark.css \
            ../gtk-"$major"."$css_minor"-compact/gtk-contained-dark.css
        echo Copied to ../gtk-"$major"."$css_minor"-compact/gtk-contained-dark.css
        cp -f ../gtk-"$major"."$css_minor"-dark-compact/gtk-contained-dark.css \
            ../gtk-"$major"."$css_minor"-light-compact/gtk-contained-dark.css
        echo Copied to ../gtk-"$major"."$css_minor"-light-compact/gtk-contained-dark.css
        ;;
esac

exit 0
