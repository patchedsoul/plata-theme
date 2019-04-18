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

SRC_FILE="Resource/colors/plata-noir.styles"
KEY_FILE="../../gtk/sass/common/resources/_key_colors.scss"

# Generate CSS for color source
SASSC="`command -v sassc`"
SASSC_OPTION="-M -t nested"

$SASSC $SASSC_OPTION sass/air-dark.scss sass/air-dark.css

# Pick up RGB values from CSS
RB="`grep -e rb sass/air-dark.css | cut -d':' -f2 | cut -d';' -f1`"
GB="`grep -e gb sass/air-dark.css | cut -d':' -f2 | cut -d';' -f1`"
BB="`grep -e bb sass/air-dark.css | cut -d':' -f2 | cut -d';' -f1`"
RL="`grep -e rl sass/air-dark.css | cut -d':' -f2 | cut -d';' -f1`"
GL="`grep -e gl sass/air-dark.css | cut -d':' -f2 | cut -d';' -f1`"
BL="`grep -e bl sass/air-dark.css | cut -d':' -f2 | cut -d';' -f1`"

# Colors in HEXs
selection="`grep -e selection sass/air-dark.css | cut -d':' -f2 | cut -d';' -f1`"
accent="`grep -e accent_label sass/air-dark.css | cut -d':' -f2 | cut -d';' -f1`"

# Check and re-color color-scheme
if [ -e $KEY_FILE ]; then
    cp -f $SRC_FILE.in $SRC_FILE && sleep 1

    echo Setting selection-color $selection...
    sed -i "s/@R_BG@/$RB/gi" $SRC_FILE
    sed -i "s/@G_BG@/$GB/gi" $SRC_FILE
    sed -i "s/@B_BG@/$BB/gi" $SRC_FILE

    echo Setting accent-label-color $accent...
    sed -i "s/@R_LABEL@/$RL/gi" $SRC_FILE
    sed -i "s/@G_LABEL@/$GL/gi" $SRC_FILE
    sed -i "s/@B_LABEL@/$BL/gi" $SRC_FILE

    rm -f sass/air-dark.css # clean up CSS
else
    echo ../../gtk/sass/common/resource/_key_colors.scss was not found. Stopped...
    exit 1
fi

exit 0
