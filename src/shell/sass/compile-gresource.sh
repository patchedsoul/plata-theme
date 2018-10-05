#!/bin/sh
#
# This file is part of plata-theme
#
# Copyright (C) 2018 Tista <tista.gma500@gmail.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#

glib-compile-resources --sourcedir="../gnome-shell" \
                       --target="../gnome-shell/gnome-shell-theme.gresource" \
                       ./gnome-shell/gnome-shell-theme.gresource.xml
glib-compile-resources --sourcedir="../gnome-shell-light" \
                       --target="../gnome-shell-light/gnome-shell-theme.gresource" \
                       ./gnome-shell/gnome-shell-theme.gresource.xml
glib-compile-resources --sourcedir="../gnome-shell-dark" \
                       --target="../gnome-shell-dark/gnome-shell-theme.gresource" \
                       ./gnome-shell/gnome-shell-theme.gresource.xml
glib-compile-resources --sourcedir="../gnome-shell-compact" \
                       --target="../gnome-shell-compact/gnome-shell-theme.gresource" \
                       ./gnome-shell/gnome-shell-theme.gresource.xml
glib-compile-resources --sourcedir="../gnome-shell-light-compact" \
                       --target="../gnome-shell-light-compact/gnome-shell-theme.gresource" \
                       ./gnome-shell/gnome-shell-theme.gresource.xml
glib-compile-resources --sourcedir="../gnome-shell-dark-compact" \
                       --target="../gnome-shell-dark-compact/gnome-shell-theme.gresource" \
                       ./gnome-shell/gnome-shell-theme.gresource.xml
