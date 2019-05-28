#! /bin/bash
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

RC_FILE="gtkrc"
RC_LIGHT_FILE="gtkrc-light"
RC_DARK_FILE="gtkrc-dark"

# Set variant specific names
cp -f $RC_FILE.in $RC_FILE && cp -f $RC_DARK_FILE.in $RC_DARK_FILE \
    && cp -f $RC_LIGHT_FILE.in $RC_LIGHT_FILE

sed -i "s|@VARIANT[@]||g" "$RC_FILE"
sed -i "s|@VARIANT[@]||g" "$RC_DARK_FILE"
sed -i "s|@VARIANT[@]||g" "$RC_LIGHT_FILE"

cp -f $RC_FILE.in $RC_FILE-compact && \
    cp -f $RC_DARK_FILE.in $RC_DARK_FILE-compact && \
    cp -f $RC_LIGHT_FILE.in $RC_LIGHT_FILE-compact

sed -i "s|@VARIANT[@]|-compact|g" "$RC_FILE"-compact
sed -i "s|@VARIANT[@]|-compact|g" "$RC_DARK_FILE"-compact
sed -i "s|@VARIANT[@]|-compact|g" "$RC_LIGHT_FILE"-compact

# Generate CSSs for color source
SASSC="`command -v sassc`"
SASSC_OPTION="-M -t nested"

$SASSC $SASSC_OPTION ../sass/2.0/gtk-light.scss ../sass/2.0/gtk-light.css
$SASSC $SASSC_OPTION ../sass/2.0/gtk-dark.scss ../sass/2.0/gtk-dark.css

# Colors in HEXs
l_sel_bg="`grep -e sel_bg ../sass/2.0/gtk-light.css | cut -c11-17`"
l_sel_lb="`grep -e sel_lb ../sass/2.0/gtk-light.css | cut -c11-17`"
l_acc_fg="`grep -e acc_fg ../sass/2.0/gtk-light.css | cut -c11-17`"
l_acc_bg="`grep -e acc_bg ../sass/2.0/gtk-light.css | cut -c11-17`"
l_lkn_fg="`grep -e lkn_fg ../sass/2.0/gtk-light.css | cut -c11-17`"
l_lkv_fg="`grep -e lkv_fg ../sass/2.0/gtk-light.css | cut -c11-17`"

d_sel_bg="`grep -e sel_bg ../sass/2.0/gtk-dark.css | cut -c11-17`"
d_sel_lb="`grep -e sel_lb ../sass/2.0/gtk-dark.css | cut -c11-17`"
d_acc_fg="`grep -e acc_fg ../sass/2.0/gtk-dark.css | cut -c11-17`"
d_acc_bg="`grep -e acc_bg ../sass/2.0/gtk-dark.css | cut -c11-17`"
d_lkn_fg="`grep -e lkn_fg ../sass/2.0/gtk-dark.css | cut -c11-17`"
d_lkv_fg="`grep -e lkv_fg ../sass/2.0/gtk-dark.css | cut -c11-17`"

# Check and re-color 'selection', 'accent' and 'link' colors
if [ -e "../sass/common/resources/_key_colors.scss" ]; then
    echo Setting selection-color $l_sel_bg \(light and mixed\) $d_sel_bg \(dark\)...
    sed -i "s/@SEL_BG@/$l_sel_bg/gi" $RC_FILE
    sed -i "s/@SEL_BG@/$l_sel_bg/gi" $RC_FILE-compact
    sed -i "s/@SEL_BG@/$l_sel_bg/gi" $RC_LIGHT_FILE
    sed -i "s/@SEL_BG@/$l_sel_bg/gi" $RC_LIGHT_FILE-compact
    sed -i "s/@SEL_BG@/$d_sel_bg/gi" $RC_DARK_FILE
    sed -i "s/@SEL_BG@/$d_sel_bg/gi" $RC_DARK_FILE-compact

    echo Setting selected-label-color $l_sel_lb \(light and mixed\) $d_sel_lb \(dark\)...
    sed -i "s/@SEL_LB@/$l_sel_lb/gi" $RC_FILE
    sed -i "s/@SEL_LB@/$l_sel_lb/gi" $RC_FILE-compact
    sed -i "s/@SEL_LB@/$l_sel_lb/gi" $RC_LIGHT_FILE
    sed -i "s/@SEL_LB@/$l_sel_lb/gi" $RC_LIGHT_FILE-compact
    sed -i "s/@SEL_LB@/$d_sel_lb/gi" $RC_DARK_FILE
    sed -i "s/@SEL_LB@/$d_sel_lb/gi" $RC_DARK_FILE-compact

    echo Setting accent-label-color $l_acc_fg \(light and mixed\) $d_acc_fg \(dark\)...
    sed -i "s/@ACC_FG@/$l_acc_fg/gi" $RC_FILE
    sed -i "s/@ACC_FG@/$l_acc_fg/gi" $RC_FILE-compact
    sed -i "s/@ACC_FG@/$l_acc_fg/gi" $RC_LIGHT_FILE
    sed -i "s/@ACC_FG@/$l_acc_fg/gi" $RC_LIGHT_FILE-compact
    sed -i "s/@ACC_FG@/$d_acc_fg/gi" $RC_DARK_FILE
    sed -i "s/@ACC_FG@/$d_acc_fg/gi" $RC_DARK_FILE-compact

    echo Setting inverted-accent-label-color $d_acc_fg \(mixed\)...
    sed -i "s/@ACI_FG@/$d_acc_fg/gi" $RC_FILE
    sed -i "s/@ACI_FG@/$d_acc_fg/gi" $RC_FILE-compact

    echo Setting accent-color $l_acc_bg \(light and mixed\) $d_acc_bg \(dark\)...
    sed -i "s/@ACC_BG@/$l_acc_bg/gi" $RC_FILE
    sed -i "s/@ACC_BG@/$l_acc_bg/gi" $RC_FILE-compact
    sed -i "s/@ACC_BG@/$l_acc_bg/gi" $RC_LIGHT_FILE
    sed -i "s/@ACC_BG@/$l_acc_bg/gi" $RC_LIGHT_FILE-compact
    sed -i "s/@ACC_BG@/$d_acc_bg/gi" $RC_DARK_FILE
    sed -i "s/@ACC_BG@/$d_acc_bg/gi" $RC_DARK_FILE-compact

    echo Setting link-color $l_lkn_fg \(light and mixed\) $d_lkn_fg \(dark\)...
    sed -i "s/@LKN_FG@/$l_lkn_fg/gi" $RC_FILE
    sed -i "s/@LKN_FG@/$l_lkn_fg/gi" $RC_FILE-compact
    sed -i "s/@LKN_FG@/$l_lkn_fg/gi" $RC_LIGHT_FILE
    sed -i "s/@LKN_FG@/$l_lkn_fg/gi" $RC_LIGHT_FILE-compact
    sed -i "s/@LKN_FG@/$d_lkn_fg/gi" $RC_DARK_FILE
    sed -i "s/@LKN_FG@/$d_lkn_fg/gi" $RC_DARK_FILE-compact

    echo Setting visited-link-color $l_lkv_fg \(light and mixed\) $d_lkv_fg \(dark\)...
    sed -i "s/@LKV_FG@/$l_lkv_fg/gi" $RC_FILE
    sed -i "s/@LKV_FG@/$l_lkv_fg/gi" $RC_FILE-compact
    sed -i "s/@LKV_FG@/$l_lkv_fg/gi" $RC_LIGHT_FILE
    sed -i "s/@LKV_FG@/$l_lkv_fg/gi" $RC_LIGHT_FILE-compact
    sed -i "s/@LKV_FG@/$d_lkv_fg/gi" $RC_DARK_FILE
    sed -i "s/@LKV_FG@/$d_lkv_fg/gi" $RC_DARK_FILE-compact

    rm -f ../sass/2.0/gtk-light.css ../sass/2.0/gtk-dark.css # clean up CSSs
else
    echo ../sass/common/resources/_key_colors.scss was not found. Stopped...
    exit 1
fi

exit 0
