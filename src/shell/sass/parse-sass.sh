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

#################
# Generate CSSs #
#################

SASSC="`command -v sassc` -M -t compact"
PKG_CONFIG="`command -v pkg-config`"

# Gnome-Shell
GIO_VERSION="`$PKG_CONFIG --modversion glib-2.0`"
GIO_MAJOR_VERSION="`echo $GIO_VERSION | cut -d'.' -f1`"
GIO_MINOR_VERSION="`echo $GIO_VERSION | cut -d'.' -f2`"

if [ $GIO_MAJOR_VERSION -eq "2" ] && [ $GIO_MINOR_VERSION -lt "48" ]; then
    echo Unmet dependency: glib-2.0 >= 2.48.0
    exit 1
else
    if [ $GIO_MINOR_VERSION -ge "59" ]; then
        GNOME_SCSS_VERSION="3.32"
        echo Processing for GNOME '>=' $GNOME_SCSS_VERSION
    elif [ $GIO_MINOR_VERSION -ge "53" ]; then
        GNOME_SCSS_VERSION="3.26"
        GNOME_SCSS_NEXT_VERSION="3.32"
        echo Processing for $GNOME_SCSS_VERSION '=<' GNOME '<' $GNOME_SCSS_NEXT_VERSION
    else
        GNOME_SCSS_VERSION="3.24"
        echo Processing for GNOME '=<' $GNOME_SCSS_VERSION
    fi

    mkdir -p ../gnome-shell \
             ../gnome-shell-light \
             ../gnome-shell-dark \
             ../gnome-shell-compact \
             ../gnome-shell-light-compact \
             ../gnome-shell-dark-compact \
             ../gnome-shell/extensions/window-list \
             ../gnome-shell/extensions/workspaces-to-dock \
             ../gnome-shell-light/extensions/window-list \
             ../gnome-shell-light/extensions/workspaces-to-dock \
             ../gnome-shell-dark/extensions/window-list \
             ../gnome-shell-dark/extensions/workspaces-to-dock \
             ../gnome-shell-compact/extensions/window-list \
             ../gnome-shell-compact/extensions/workspaces-to-dock \
             ../gnome-shell-light-compact/extensions/window-list \
             ../gnome-shell-light-compact/extensions/workspaces-to-dock \
             ../gnome-shell-dark-compact/extensions/window-list \
             ../gnome-shell-dark-compact/extensions/workspaces-to-dock

    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/gnome-shell.scss \
        ../gnome-shell/gnome-shell.css
    echo Wrote ../gnome-shell/gnome-shell.css
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/gnome-shell-light.scss \
        ../gnome-shell-light/gnome-shell.css
    echo Wrote ../gnome-shell-light/gnome-shell.css
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/gnome-shell-dark.scss \
        ../gnome-shell-dark/gnome-shell.css
    echo Wrote ../gnome-shell-dark/gnome-shell.css
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/gnome-shell-compact.scss \
        ../gnome-shell-compact/gnome-shell.css
    echo Wrote ../gnome-shell-compact/gnome-shell.css
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/gnome-shell-light-compact.scss \
        ../gnome-shell-light-compact/gnome-shell.css
    echo Wrote ../gnome-shell-light-compact/gnome-shell.css
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/gnome-shell-dark-compact.scss \
        ../gnome-shell-dark-compact/gnome-shell.css
    echo Wrote ../gnome-shell-dark-compact/gnome-shell.css
    if [ $GIO_MINOR_VERSION -ge "53" ]; then
        $SASSC \
            gnome-shell/$GNOME_SCSS_VERSION/gdm3.scss \
            ../gnome-shell/gdm3-Plata.css
        echo Wrote ../gnome-shell/gdm3-Plata.css
        $SASSC \
            gnome-shell/$GNOME_SCSS_VERSION/gdm3-light.scss \
            ../gnome-shell-light/gdm3-Plata-Lumine.css
        echo Wrote ../gnome-shell-light/gdm3-Plata-Lumine.css
        $SASSC \
            gnome-shell/$GNOME_SCSS_VERSION/gdm3-dark.scss \
            ../gnome-shell-dark/gdm3-Plata-Noir.css
        echo Wrote ../gnome-shell-dark/gdm3-Plata-Noir.css
        $SASSC \
            gnome-shell/$GNOME_SCSS_VERSION/gdm3-compact.scss \
            ../gnome-shell-compact/gdm3-Plata-Compact.css
        echo Wrote ../gnome-shell-compact/gdm3-Plata-Compact.css
        $SASSC \
            gnome-shell/$GNOME_SCSS_VERSION/gdm3-light-compact.scss \
            ../gnome-shell-light-compact/gdm3-Plata-Lumine-Compact.css
        echo Wrote ../gnome-shell-light-compact/gdm3-Plata-Lumine-Compact.css
        $SASSC \
            gnome-shell/$GNOME_SCSS_VERSION/gdm3-dark-compact.scss \
            ../gnome-shell-dark-compact/gdm3-Plata-Noir-Compact.css
        echo Wrote ../gnome-shell-dark-compact/gdm3-Plata-Noir-Compact.css
    fi
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/pad-osd.scss \
        ../gnome-shell/pad-osd.css
    echo Wrote ../gnome-shell/pad-osd.css
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/pad-osd.scss \
        ../gnome-shell-light/pad-osd.css
    echo Wrote ../gnome-shell-light/pad-osd.css
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/pad-osd.scss \
        ../gnome-shell-dark/pad-osd.css
    echo Wrote ../gnome-shell-dark/pad-osd.css
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/pad-osd.scss \
        ../gnome-shell-compact/pad-osd.css
    echo Wrote ../gnome-shell-compact/pad-osd.css
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/pad-osd.scss \
        ../gnome-shell-light-compact/pad-osd.css
    echo Wrote ../gnome-shell-light-compact/pad-osd.css
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/pad-osd.scss \
        ../gnome-shell-dark-compact/pad-osd.css
    echo Wrote ../gnome-shell-dark-compact/pad-osd.css
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/stylesheet-dark.scss \
        ../gnome-shell/extensions/window-list/stylesheet.css
    echo Wrote ../gnome-shell/extensions/window-list/stylesheet.css
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/stylesheet-light.scss \
        ../gnome-shell-light/extensions/window-list/stylesheet.css
    echo Wrote ../gnome-shell-light/extensions/window-list/stylesheet.css
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/stylesheet-dark.scss \
        ../gnome-shell-dark/extensions/window-list/stylesheet.css
    echo Wrote ../gnome-shell-dark/extensions/window-list/stylesheet.css
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/stylesheet-dark.scss \
        ../gnome-shell-compact/extensions/window-list/stylesheet.css
    echo Wrote ../gnome-shell-compact/extensions/window-list/stylesheet.css
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/stylesheet-light.scss \
        ../gnome-shell-light-compact/extensions/window-list/stylesheet.css
    echo Wrote ../gnome-shell-light-compact/extensions/window-list/stylesheet.css
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/stylesheet-dark.scss \
        ../gnome-shell-dark-compact/extensions/window-list/stylesheet.css
    echo Wrote ../gnome-shell-dark-compact/extensions/window-list/stylesheet.css
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/classic-dark.scss \
        ../gnome-shell/extensions/window-list/classic.css
    echo Wrote ../gnome-shell/extensions/window-list/classic.css
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/classic-light.scss \
        ../gnome-shell-light/extensions/window-list/classic.css
    echo Wrote ../gnome-shell-light/extensions/window-list/classic.css
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/classic-dark.scss \
        ../gnome-shell-dark/extensions/window-list/classic.css
    echo Wrote ../gnome-shell-dark/extensions/window-list/classic.css
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/classic-dark.scss \
        ../gnome-shell-compact/extensions/window-list/classic.css
    echo Wrote ../gnome-shell-compact/extensions/window-list/classic.css
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/classic-light.scss \
        ../gnome-shell-light-compact/extensions/window-list/classic.css
    echo Wrote ../gnome-shell-light-compact/extensions/window-list/classic.css
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/classic-dark.scss \
        ../gnome-shell-dark-compact/extensions/window-list/classic.css
    echo Wrote ../gnome-shell-dark-compact/extensions/window-list/classic.css
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/workspaces-to-dock-dark.scss \
        ../gnome-shell/extensions/workspaces-to-dock/workspaces-to-dock.css
    echo Wrote ../gnome-shell/extensions/workspaces-to-dock/workspaces-to-dock.css
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/workspaces-to-dock-light.scss \
        ../gnome-shell-light/extensions/workspaces-to-dock/workspaces-to-dock.css
    echo Wrote ../gnome-shell-light/extensions/workspaces-to-dock/workspaces-to-dock.css
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/workspaces-to-dock-dark.scss \
        ../gnome-shell-dark/extensions/workspaces-to-dock/workspaces-to-dock.css
    echo Wrote ../gnome-shell-dark/extensions/workspaces-to-dock/workspaces-to-dock.css
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/workspaces-to-dock-dark.scss \
        ../gnome-shell-compact/extensions/workspaces-to-dock/workspaces-to-dock.css
    echo Wrote ../gnome-shell-compact/extensions/workspaces-to-dock/workspaces-to-dock.css
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/workspaces-to-dock-light.scss \
        ../gnome-shell-light-compact/extensions/workspaces-to-dock/workspaces-to-dock.css
    echo Wrote ../gnome-shell-light-compact/extensions/workspaces-to-dock/workspaces-to-dock.css
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/workspaces-to-dock-dark.scss \
        ../gnome-shell-dark-compact/extensions/workspaces-to-dock/workspaces-to-dock.css
    echo Wrote ../gnome-shell-dark-compact/extensions/workspaces-to-dock/workspaces-to-dock.css
fi

# Cinnamon
mkdir -p ../cinnamon \
         ../cinnamon-light \
         ../cinnamon-dark

echo Processing for CINNAMON
$SASSC \
    cinnamon/cinnamon.scss ../cinnamon/cinnamon.css
echo Wrote ../cinnamon/cinnamon.css
$SASSC \
    cinnamon/cinnamon-dark.scss ../cinnamon-dark/cinnamon.css
echo Wrote ../cinnamon-dark/cinnamon.css
$SASSC \
    cinnamon/cinnamon-light.scss ../cinnamon-light/cinnamon.css
echo Wrote ../cinnamon-light/cinnamon.css

exit 0
