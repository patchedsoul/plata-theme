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

SRC_LIGHT_FILE="light/colors.tdesktop-theme"
SRC_MIXED_FILE="mixed/colors.tdesktop-theme"
SRC_DARK_FILE="dark/colors.tdesktop-theme"
KEY_FILE="../../gtk/sass/common/resources/_key_colors.scss"

# Generate CSSs for color source
SASSC="`command -v sassc`"
SASSC_OPTION="-M -t nested"

$SASSC $SASSC_OPTION sass/telegram_light.scss sass/telegram_light.css
$SASSC $SASSC_OPTION sass/telegram_dark.scss sass/telegram_dark.css

# Colors in HEXs
l_sel_bg="`grep -e sel_bg sass/telegram_light.css | cut -c11-17`"
l_acc_fg="`grep -e acc_fg sass/telegram_light.css | cut -c11-17`"
l_acc_bg="`grep -e acc_bg sass/telegram_light.css | cut -c11-17`"
l_acc_f1="`grep -e acc_f1 sass/telegram_light.css | cut -c11-17`"
l_acc_f2="`grep -e acc_f2 sass/telegram_light.css | cut -c11-17`"
l_sgt_bg="`grep -e sgt_bg sass/telegram_light.css | cut -c11-17`"
l_sgt_f1="`grep -e sgt_f1 sass/telegram_light.css | cut -c11-17`"
l_sgt_f2="`grep -e sgt_f2 sass/telegram_light.css | cut -c11-17`"
l_dst_bg="`grep -e dst_bg sass/telegram_light.css | cut -c11-17`"
l_dst_f1="`grep -e dst_f1 sass/telegram_light.css | cut -c11-17`"
l_dst_f2="`grep -e dst_f2 sass/telegram_light.css | cut -c11-17`"

d_sel_bg="`grep -e sel_bg sass/telegram_dark.css | cut -c11-17`"
d_acc_fg="`grep -e acc_fg sass/telegram_dark.css | cut -c11-17`"
d_acc_bg="`grep -e acc_bg sass/telegram_dark.css | cut -c11-17`"
d_acc_f1="`grep -e acc_f1 sass/telegram_dark.css | cut -c11-17`"
d_acc_f2="`grep -e acc_f2 sass/telegram_dark.css | cut -c11-17`"
d_sgt_bg="`grep -e sgt_bg sass/telegram_dark.css | cut -c11-17`"
d_sgt_f1="`grep -e sgt_f1 sass/telegram_dark.css | cut -c11-17`"
d_sgt_f2="`grep -e sgt_f2 sass/telegram_dark.css | cut -c11-17`"
d_dst_bg="`grep -e dst_bg sass/telegram_dark.css | cut -c11-17`"
d_dst_f1="`grep -e dst_f1 sass/telegram_dark.css | cut -c11-17`"
d_dst_f2="`grep -e dst_f2 sass/telegram_dark.css | cut -c11-17`"

# Check and re-color color-scheme
if [ -e $KEY_FILE ]; then
    cp -f $SRC_LIGHT_FILE.in $SRC_LIGHT_FILE && \
    cp -f $SRC_MIXED_FILE.in $SRC_MIXED_FILE && \
    cp -f $SRC_DARK_FILE.in $SRC_DARK_FILE && sleep 1

    echo Setting selection-color $l_sel_bg \(light\) $d_sel_bg \(dark\)...
    sed -i "s/@SEL_BG@/$l_sel_bg/gi" $SRC_LIGHT_FILE
    sed -i "s/@SEL_BG@/$l_sel_bg/gi" $SRC_MIXED_FILE
    sed -i "s/@SEL_BG@/$d_sel_bg/gi" $SRC_DARK_FILE

    echo Setting accent-label-color $l_acc_fg \(light\) $d_acc_fg \(dark\)...
    sed -i "s/@ACC_FG@/$l_acc_fg/gi" $SRC_LIGHT_FILE
    sed -i "s/@ACC_FG@/$l_acc_fg/gi" $SRC_MIXED_FILE
    sed -i "s/@ACC_FG@/$d_acc_fg/gi" $SRC_DARK_FILE

    echo Setting accent-color $l_acc_bg \(light\) $d_acc_bg \(dark\)...
    sed -i "s/@ACC_BG@/$l_acc_bg/gi" $SRC_LIGHT_FILE
    sed -i "s/@ACC_BG@/$l_acc_bg/gi" $SRC_MIXED_FILE
    sed -i "s/@ACC_BG@/$d_acc_bg/gi" $SRC_DARK_FILE

    echo Setting accent-fill-color $l_acc_f1 \(light\) $d_acc_f1 \(dark\)...
    sed -i "s/@ACC_FILL1@/$l_acc_f1/gi" $SRC_LIGHT_FILE
    sed -i "s/@ACC_FILL1@/$l_acc_f1/gi" $SRC_MIXED_FILE
    sed -i "s/@ACC_FILL1@/$d_acc_f1/gi" $SRC_DARK_FILE

    echo Setting accent-active-fill-color $l_acc_f2 \(light\) $d_acc_f2 \(dark\)...
    sed -i "s/@ACC_FILL2@/$l_acc_f2/gi" $SRC_LIGHT_FILE
    sed -i "s/@ACC_FILL2@/$l_acc_f2/gi" $SRC_MIXED_FILE
    sed -i "s/@ACC_FILL2@/$d_acc_f2/gi" $SRC_DARK_FILE

    echo Setting suggested-color $l_sgt_bg \(light\) $d_sgt_bg \(dark\)...
    sed -i "s/@SGT_BG@/$l_sgt_bg/gi" $SRC_LIGHT_FILE
    sed -i "s/@SGT_BG@/$l_sgt_bg/gi" $SRC_MIXED_FILE
    sed -i "s/@SGT_BG@/$d_sgt_bg/gi" $SRC_DARK_FILE

    echo Setting suggested-fill-color $l_sgt_f1 \(light\) $d_sgt_f1 \(dark\)...
    sed -i "s/@SGT_FILL1@/$l_sgt_f1/gi" $SRC_LIGHT_FILE
    sed -i "s/@SGT_FILL1@/$l_sgt_f1/gi" $SRC_MIXED_FILE
    sed -i "s/@SGT_FILL1@/$d_sgt_f1/gi" $SRC_DARK_FILE

    echo Setting suggested-active-fill-color $l_sgt_f2 \(light\) $d_sgt_f2 \(dark\)...
    sed -i "s/@SGT_FILL2@/$l_sgt_f2/gi" $SRC_LIGHT_FILE
    sed -i "s/@SGT_FILL2@/$l_sgt_f2/gi" $SRC_MIXED_FILE
    sed -i "s/@SGT_FILL2@/$d_sgt_f2/gi" $SRC_DARK_FILE

    echo Setting destructive-color $l_dst_bg \(light\) $d_dst_bg \(dark\)...
    sed -i "s/@DST_BG@/$l_dst_bg/gi" $SRC_LIGHT_FILE
    sed -i "s/@DST_BG@/$l_dst_bg/gi" $SRC_MIXED_FILE
    sed -i "s/@DST_BG@/$d_dst_bg/gi" $SRC_DARK_FILE

    echo Setting destructive-fill-color $l_dst_f1 \(light\) $d_dst_f1 \(dark\)...
    sed -i "s/@DST_FILL1@/$l_dst_f1/gi" $SRC_LIGHT_FILE
    sed -i "s/@DST_FILL1@/$l_dst_f1/gi" $SRC_MIXED_FILE
    sed -i "s/@DST_FILL1@/$d_dst_f1/gi" $SRC_DARK_FILE

    echo Setting destructive-active-fill-color $l_dst_f2 \(light\) $d_dst_f2 \(dark\)...
    sed -i "s/@DST_FILL2@/$l_dst_f2/gi" $SRC_LIGHT_FILE
    sed -i "s/@DST_FILL2@/$l_dst_f2/gi" $SRC_MIXED_FILE
    sed -i "s/@DST_FILL2@/$d_dst_f2/gi" $SRC_DARK_FILE

    rm -f sass/telegram_light.css sass/telegram_dark.css # clean up CSSs
else
    echo ../../gtk/sass/common/resource/_key_colors.scss was not found. Stopped...
    exit 1
fi

exit 0
