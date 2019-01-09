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

PKG_CONFIG="`command -v pkg-config`"

GIO_VERSION="`$PKG_CONFIG --modversion glib-2.0`"
GIO_MAJOR_VERSION="`echo $GIO_VERSION | cut -d'.' -f1`"
GIO_MINOR_VERSION="`echo $GIO_VERSION | cut -d'.' -f2`"

if [ $GIO_MAJOR_VERSION -eq "2" ] && [ $GIO_MINOR_VERSION -lt "48" ]; then
    echo Unmet dependency: glib-2.0 >= 2.48.0
    exit 1
else
    if [ $GIO_MINOR_VERSION -ge "59" ]; then
        GNOME_SCSS_VERSION="3.32"
        echo Compiling for GNOME '>=' $GNOME_SCSS_VERSION
    elif [ $GIO_MINOR_VERSION -ge "53" ]; then
        GNOME_SCSS_VERSION="3.26"
        GNOME_SCSS_NEXT_VERSION="3.32"
        echo Compiling for $GNOME_SCSS_VERSION '=<' GNOME '<' $GNOME_SCSS_NEXT_VERSION
    else
        GNOME_SCSS_VERSION="3.24"
        echo Compiling for GNOME '=<' $GNOME_SCSS_VERSION
    fi
fi

glib-compile-resources --sourcedir="../gnome-shell" \
                       --target="../gnome-shell/gnome-shell-theme.gresource" \
                       ./gnome-shell/$GNOME_SCSS_VERSION/gnome-shell-theme.gresource.xml
glib-compile-resources --sourcedir="../gnome-shell-light" \
                       --target="../gnome-shell-light/gnome-shell-theme.gresource" \
                       ./gnome-shell/$GNOME_SCSS_VERSION/gnome-shell-theme.gresource.xml
glib-compile-resources --sourcedir="../gnome-shell-dark" \
                       --target="../gnome-shell-dark/gnome-shell-theme.gresource" \
                       ./gnome-shell/$GNOME_SCSS_VERSION/gnome-shell-theme.gresource.xml
glib-compile-resources --sourcedir="../gnome-shell-compact" \
                       --target="../gnome-shell-compact/gnome-shell-theme.gresource" \
                       ./gnome-shell/$GNOME_SCSS_VERSION/gnome-shell-theme.gresource.xml
glib-compile-resources --sourcedir="../gnome-shell-light-compact" \
                       --target="../gnome-shell-light-compact/gnome-shell-theme.gresource" \
                       ./gnome-shell/$GNOME_SCSS_VERSION/gnome-shell-theme.gresource.xml
glib-compile-resources --sourcedir="../gnome-shell-dark-compact" \
                       --target="../gnome-shell-dark-compact/gnome-shell-theme.gresource" \
                       ./gnome-shell/$GNOME_SCSS_VERSION/gnome-shell-theme.gresource.xml
