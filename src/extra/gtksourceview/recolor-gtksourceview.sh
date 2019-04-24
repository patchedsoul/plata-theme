#! /bin/bash
#
# This file is part of plata-theme
#
# Copyright (C) 2019 Tista <tista.gma500@gmail.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#

SRC_LIGHT_FILE="plata-light.xml"
SRC_DARK_FILE="plata-dark.xml"
KEY_FILE="../../gtk/sass/common/resources/_key_colors.scss"

# Generate CSS for color source
SASSC="`command -v sassc`"
SASSC_OPTION="-M -t nested"

$SASSC $SASSC_OPTION sass/gtksourceview.scss sass/gtksourceview.css

# Colors in HEXs
selection1="`grep -e selection1 sass/gtksourceview.css | cut -c15-21`"
selection2="`grep -e selection2 sass/gtksourceview.css | cut -c15-21`"

# Check and re-color color-scheme
if [ -e $KEY_FILE ]; then
    cp -f $SRC_LIGHT_FILE.in $SRC_LIGHT_FILE && \
    cp -f $SRC_DARK_FILE.in $SRC_DARK_FILE && sleep 1

    echo Setting selection-color-1 $selection1...
    sed -i "s/@selection1@/$selection1/gi" $SRC_LIGHT_FILE
    sed -i "s/@selection1@/$selection1/gi" $SRC_DARK_FILE

    echo Setting selection-color-2 $selection2...
    sed -i "s/@selection2@/$selection2/gi" $SRC_LIGHT_FILE

    rm -f sass/gtksourceview.css # clean up CSS
else
    echo ../../gtk/sass/common/resource/_key_colors.scss was not found. Stopped...
    exit 1
fi

exit 0
