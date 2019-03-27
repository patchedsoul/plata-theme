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

# Usage: ./compile-gresource.sh GTK_VERSION
#
# Example:
#   ./compile-gresource.sh 3.22
#
#   compile gtk.gresouce for Gtk version 3.22

usage() {
    sed -rn '/^# Usage/,${/^#/!q;s/^# ?//;p}' "$0"
}

#############
# Compiling #
#############

xml="gtk.gresource.xml"
xml_dark="gtk-dark.gresource.xml"
image_list="`grep -e '.png' ./$xml.in | cut -d'>' -f2 | cut -d'<' -f1 | \
           cut -d'/' -f2`"

for i in $image_list
do
    if [ ! -f ../asset/assets-gtk3/$i ]; then
        echo "Error: 'assets-gtk3/$i' not found, aborted..."
        exit 1
    fi
done

case "$1" in
    3.20|3.22|3.24|4.0)
        cp "$xml".in ../gtk-"$1"/"$xml"
        sed -i "s|@VERSION[@]|$1|g" ../gtk-"$1"/"$xml"
        sed -i "s|@VARIANT[@]||g" ../gtk-"$1"/"$xml"
        cd ../gtk-"$1" && ln -sf ../asset/assets-gtk3 assets && cd ../sass
        $(command -v glib-compile-resources) --sourcedir=../gtk-"$1" \
                                             ../gtk-"$1"/"$xml"
        echo '@import url("resource:///com/plata-theme/gtk-'$1'/gtk-contained.css");' \
            > ../gtk-"$1"/gtk.css
        echo '@import url("resource:///com/plata-theme/gtk-'$1'/gtk-contained-dark.css");' \
            > ../gtk-"$1"/gtk-dark.css

        rm -f ../gtk-"$1"/"$xml"
        rm -rf ../gtk-"$1"/assets

        cp "$xml".in ../gtk-"$1"-compact/"$xml"
        sed -i "s|@VERSION[@]|$1|g" ../gtk-"$1"-compact/"$xml"
        sed -i "s|@VARIANT[@]|-compact|g" ../gtk-"$1"-compact/"$xml"
        cd ../gtk-"$1"-compact && ln -sf ../asset/assets-gtk3 assets && cd ../sass
        $(command -v glib-compile-resources) --sourcedir=../gtk-"$1"-compact \
                                             ../gtk-"$1"-compact/"$xml"
        echo '@import url("resource:///com/plata-theme/gtk-'$1'-compact/gtk-contained.css");' \
            > ../gtk-"$1"-compact/gtk.css
        echo '@import url("resource:///com/plata-theme/gtk-'$1'-compact/gtk-contained-dark.css");' \
            > ../gtk-"$1"-compact/gtk-dark.css

        rm -f ../gtk-"$1"-compact/"$xml"
        rm -rf ../gtk-"$1"-compact/assets

        cp "$xml".in ../gtk-"$1"-light/"$xml"
        sed -i "s|@VERSION[@]|$1|g" ../gtk-"$1"-light/"$xml"
        sed -i "s|@VARIANT[@]|-light|g" ../gtk-"$1"-light/"$xml"
        cd ../gtk-"$1"-light && ln -sf ../asset/assets-gtk3 assets && cd ../sass
        $(command -v glib-compile-resources) --sourcedir=../gtk-"$1"-light \
                                             ../gtk-"$1"-light/"$xml"
        echo '@import url("resource:///com/plata-theme/gtk-'$1'-light/gtk-contained.css");' \
            > ../gtk-"$1"-light/gtk.css
        echo '@import url("resource:///com/plata-theme/gtk-'$1'-light/gtk-contained-dark.css");' \
            > ../gtk-"$1"-light/gtk-dark.css

        rm -f ../gtk-"$1"-light/"$xml"
        rm -rf ../gtk-"$1"-light/assets

        cp "$xml".in ../gtk-"$1"-light-compact/"$xml"
        sed -i "s|@VERSION[@]|$1|g" ../gtk-"$1"-light-compact/"$xml"
        sed -i "s|@VARIANT[@]|-light-compact|g" ../gtk-"$1"-light-compact/"$xml"
        cd ../gtk-"$1"-light-compact && ln -sf ../asset/assets-gtk3 assets && cd ../sass
        $(command -v glib-compile-resources) --sourcedir=../gtk-"$1"-light-compact \
                                             ../gtk-"$1"-light-compact/"$xml"
        echo '@import url("resource:///com/plata-theme/gtk-'$1'-light-compact/gtk-contained.css");' \
            > ../gtk-"$1"-light-compact/gtk.css
        echo '@import url("resource:///com/plata-theme/gtk-'$1'-light-compact/gtk-contained-dark.css");' \
            > ../gtk-"$1"-light-compact/gtk-dark.css

        rm -f ../gtk-"$1"-light-compact/"$xml"
        rm -rf ../gtk-"$1"-light-compact/assets

        cp "$xml_dark".in ../gtk-"$1"-dark/"$xml"
        sed -i "s|@VERSION[@]|$1|g" ../gtk-"$1"-dark/"$xml"
        sed -i "s|@VARIANT[@]|-dark|g" ../gtk-"$1"-dark/"$xml"
        cd ../gtk-"$1"-dark && ln -sf ../asset/assets-gtk3 assets && cd ../sass
        $(command -v glib-compile-resources) --sourcedir=../gtk-"$1"-dark \
                                             ../gtk-"$1"-dark/"$xml"
        echo '@import url("resource:///com/plata-theme/gtk-'$1'-dark/gtk-contained-dark.css");' \
            > ../gtk-"$1"-dark/gtk.css

        rm -f ../gtk-"$1"-dark/"$xml"
        rm -rf ../gtk-"$1"-dark/assets

        cp "$xml_dark".in ../gtk-"$1"-dark-compact/"$xml"
        sed -i "s|@VERSION[@]|$1|g" ../gtk-"$1"-dark-compact/"$xml"
        sed -i "s|@VARIANT[@]|-dark-compact|g" ../gtk-"$1"-dark-compact/"$xml"
        cd ../gtk-"$1"-dark-compact && ln -sf ../asset/assets-gtk3 assets && cd ../sass
        $(command -v glib-compile-resources) --sourcedir=../gtk-"$1"-dark-compact \
                                             ../gtk-"$1"-dark-compact/"$xml"
        echo '@import url("resource:///com/plata-theme/gtk-'$1'-dark-compact/gtk-contained-dark.css");' \
            > ../gtk-"$1"-dark-compact/gtk.css

        rm -f ../gtk-"$1"-dark-compact/"$xml"
        rm -rf ../gtk-"$1"-dark-compact/assets
        ;;
    *)
        usage && exit 1
        ;;
esac

exit 0
