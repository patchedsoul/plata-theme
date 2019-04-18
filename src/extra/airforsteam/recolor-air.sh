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
COL_FILE="../../gtk/sass/common/_colors.scss"
KEY_FILE="../../gtk/sass/common/resources/_key_colors.scss"

# Default colors
selection1="`grep 'Indigo500' $COL_FILE | \
                   cut -d' ' -f3`"

# Generate CSS for color source
SASSC="`command -v sassc`"
SASSC_OPTION="-M -t nested"

$SASSC $SASSC_OPTION sass/air-dark.scss sass/air-dark.css

# Default RGB values
RL1="135"
GL1="150"
BL1="237"
RB1="63"
GB1="81"
BB1="181"

# Pick up RGB values from CSS
RL2="`grep -e rl sass/air-dark.css | cut -d':' -f2 | cut -d';' -f1`"
GL2="`grep -e gl sass/air-dark.css | cut -d':' -f2 | cut -d';' -f1`"
BL2="`grep -e bl sass/air-dark.css | cut -d':' -f2 | cut -d';' -f1`"
RB2="`grep -e rb sass/air-dark.css | cut -d':' -f2 | cut -d';' -f1`"
GB2="`grep -e gb sass/air-dark.css | cut -d':' -f2 | cut -d';' -f1`"
BB2="`grep -e bb sass/air-dark.css | cut -d':' -f2 | cut -d';' -f1`"

# Check and re-color color-scheme
if [ -e $KEY_FILE ]; then
    selection2="`grep 'key_selection' $KEY_FILE | \
                 cut -d' ' -f2 | cut -d';' -f1`"

    cp -f $SRC_FILE.in $SRC_FILE && sleep 1

    if [ $selection1 = $selection2 ]; then
        sed -i "s/@R_LABEL@/$RL1/gi" $SRC_FILE
        sed -i "s/@G_LABEL@/$GL1/gi" $SRC_FILE
        sed -i "s/@B_LABEL@/$BL1/gi" $SRC_FILE
        sed -i "s/@R_BG@/$RB1/gi" $SRC_FILE
        sed -i "s/@G_BG@/$GB1/gi" $SRC_FILE
        sed -i "s/@B_BG@/$BB1/gi" $SRC_FILE
    else
        sed -i "s/@R_LABEL@/$RL2/gi" $SRC_FILE
        sed -i "s/@G_LABEL@/$GL2/gi" $SRC_FILE
        sed -i "s/@B_LABEL@/$BL2/gi" $SRC_FILE
        sed -i "s/@R_BG@/$RB2/gi" $SRC_FILE
        sed -i "s/@G_BG@/$GB2/gi" $SRC_FILE
        sed -i "s/@B_BG@/$BB2/gi" $SRC_FILE
        echo re-colored with $selection2.
    fi

    rm -f sass/air-dark.css # clean up CSS
else
    echo ../../gtk/sass/common/resource/_key_colors.scss was not found. Stopped...
    exit 1
fi

exit 0
