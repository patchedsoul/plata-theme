<img src=".gitlab/logo_thumb_small.png" alt="Logo" align="left" width="85" height="85"/>

### Plata-theme

A Gtk theme based on Material Design Refresh.

----------------------------------------------

Typography
----------

Plata strongly depends on Material Design resources, especially its **fonts**.

 1. [**Roboto**](https://fonts.google.com/specimen/Roboto)
   - Very famous as the default truetype font in Android (English ver.).
   - Multilingual support is not good.
   - Weight used in Plata: 300, 400, 500, 700

| |Primary|Fallback|
|:-----|:-----:|:-----:|
|Gnome-Shell|**Roboto**|Sans-serif|
|Cinnamon   |**Roboto**|Sans-serif|

Plata is designed with nominal **13px (or 14px)** Roboto Regular font.
In Gnome, "window-scaling-factor = 1.0" means `-gtk-dpi = 96`, it also means:
  ```
  13 [px] x 72 [pt/inch] / 96 [px/inch] = 9.75 [pt]
  14 [px] x 72 [pt/inch] / 96 [px/inch] = 10.5 [pt]
  ```
That's the reason why `13.33px = 10pt` is used for rem/px conversion in Gtk 3.2x/4.0 theming.

> **Note:**
>
> NotoSans CJK (ChineseJapaneseKorean) opentype fonts are actually **0.1em taller than Roboto fonts**, so if 10pt Roboto was suitable on your LCDs, set 9pt for NotoSans CJK families.

**Verify the fonts are rendered correctly via font-viewer tools like Gnome-Font-Viewer.**

Required Components
-------------------
Plata supports Gtk 2.24.x, 3.20.x, 3.22.x and 3.24.x.

 ```
 * Gtk-3.0             >= 3.20.0
 * Gtk-2.0             >= 2.24.30
 * gtk2-engines-pixbuf  >= 2.24.30
 * gtk2-engines-murrine >= 0.98.1
 ```

Supported Desktop Environments
------------------------------

 ```
 * GNOME-Shell     >= 3.20.0
 * GNOME-Flashback >= 3.20
 * Budgie-Desktop  >= 10.4
 * Cinnamon        >= 3.2.0
 * XFce4           >= 4.12.2
 * LXDE            >= 0.99.1 (Gtk 2.x only)
 ```

Unsupported Gtk Based Desktop(s)
-------------------------------
 * Pantheon
 * Unity7
 * Gnome-Shell customed by downstream (Ubuntu session, Pop! OS ...etc)
 * Mate

 > **Note:**
 >
 >   * Plata does NOT support elementaryOS.

Installation from Package(s)
----------------------------
 * Arch (AUR): [**plata-theme**](https://aur.archlinux.org/packages/plata-theme)
 * OpenSUSE: [**Official repository**](https://software.opensuse.org/package/plata-theme)
 * Solus: Official repository
 * Flatpak: Official flathub repository (current package branch = **3.22**)
 * My Personal Package Archives (PPA): [**plata-theme**](https://launchpad.net/~tista/+archive/ubuntu/plata-theme)

Installation from Git Source
----------------------------
1. If previous versions were installed/existed, remove them first.

 ```
 sudo rm -rf /usr/share/themes/{Plata,Plata-Compact,Plata-Lumine,Plata-Lumine-Compact,Plata-Noir,Plata-Noir-Compact}
 sudo rm -rf /usr/local/share/themes/{Plata,Plata-Compact,Plata-Lumine,Plata-Lumine-Compact,Plata-Noir,Plata-Noir-Compact}
 rm -rf ~/.local/share/themes/{Plata,Plata-Compact,Plata-Lumine,Plata-Lumine-Compact,Plata-Noir,Plata-Noir-Compact}
 rm -rf ~/.themes/{Plata,Plata-Compact,Plata-Lumine,Plata-Lumine-Compact,Plata-Noir,Plata-Noir-Compact}
 ```

2. Check build-requirements:
 Currently Plata bundles neither pre-generated stylesheets nor PNG images.
 So users and/or contributors should generate proper CSSs, PNGs and gresources at build-time.

 ```
 * autoconf
 * automake
 * inkscape                                  >= 0.91
 * libgdk-pixbuf2.0-dev (gdk-pixbuf2-devel)  >= 2.32.2
 * libglib2.0-dev (glib2-devel)              >= 2.48.0
 * libxml2-utils (libxml2)
 * pkg-config (pkgconfig)
 * sassc                                     >= 3.3

 * parallel                                  (if --enable-parallel)
 * zip                                       (if --enable-telegram)
 ```

 > **Note:**
 >
 >   * In OpenSUSE, add an extra dependency:
 >
 >     ```
 >     gdk-pixbuf-devel        >= 2.32.2
 >     ```
 >
 >   * Plata employs **SassC** wrapper of `libsass` to generate CSS stylesheets.
 >   * Plata uses `inkscape` to generate installable PNG files.
 >   * Plata uses `glib-compile-resources` to compile the gresource files for Gtk and Gnome-Shell.
 >   * `glib-2.0 >= 2.53`, Gnome-Shell 3.26 theming is used if `--enable-gnome`.

3. Build and install system-wide:

 ```
 ./autogen.sh --prefix=/usr
 make
 sudo make install
 ```

 > **Note:**
 >
 >   * Default prefix is `/usr/local`.
 >   * All 6 variants are installed by default.
 >   * `make` generates proper CSSs and PNGs to be installed.
 >     It will take about 5min to 15min to build.
 >     For example, Ubuntu's build-server takes 10min.
 >   * `sudo make install` installs multiple versioned theme and Gtk automatically selects the properly versioned one when running.

4. To speed up by using concurrency-build, pass this specific option to `autogen.sh`:

 ```
 --enable-parallel       enable parallel-build support (type: bool)
 ```

 > **Note:**
 >
 >   * This feature requires GNU `parallel`, so please add `parallel` to build-requirements.
 >     Parallel can execute multiple scripts and binaries to be suitable for multi-threading.
 >     It could especially shorten the rendering-time via `inkscape`.
 >   * `-jN` option to be passed to GNU `make` is surely usable, but Plata currently employs `parallel`.
 >   * This feature should not be applied when packaging on remote/shared build-servers.

5. To disable some DE supports, pass these specific options to `autogen.sh`:

 ```
 --disable-gnome         disable gnome-shell support (type: bool)
 --disable-cinnamon      disable cinnamon support (type: bool)
 --disable-flashback     disable flashback support (type: bool)
 --disable-xfce          disable xfce support (type: bool)
 --disable-openbox       disable openbox support (type: bool)
 ```

 > **Note:**
 >
 >   * The installer installs Budgie-Desktop support even if all of options above were applied.
 >   * Cinnamon hooks `metacity-1` directory even if GNOME-Flashback support was disabled.

6. To enable extra Gtk release support, pass these options:

 ```
 --enable-gtk_next      enable Gtk 4.0 support (type: bool)
 ```

7. To change the default 4 **Key-Colors**, pass these options:

 ```
 --with-selection_color        Primary color for 'selected-items' (Default: #3f51b5 = Indigo500, type: string)
 --with-accent_color           Secondary color for notifications and OSDs (Default: #7986cb = Indigo300, type: string)
 --with-suggestion_color       Secondary color for 'suggested' buttons (Default: #673ab7 = DPurple500, type: string)
 --with-destruction_color      Tertiary color for 'destructive' buttons (Default: #f44336 = Red500, type: string)
 ```

 > **Note:**
 >
 >   * Color-codes are defined as `#` + 6-digit `HEX`s (Standard RGB definitions in HTML codes).
 >   * The Material Design Color Palette can be found [**here**](https://www.google.com/design/spec/style/color.html#color-color-palette).
 >   * Example: If you would like to use 'Teal500' as selection_color, use this:
 >
 >     ```./autogen.sh --with-selection_color=#009688```
 >
 >     This switchese the theme to Teal selection colors.
 >   * Basically `selection_color` and `suggestion_color` should use `500` colors,
 >     and `accent_color` should use `300` colors.
 >   * While doing `make`, Plata changes those 4 colors in all stylesheets and images,
 >     and `make clean` cleans up all generated files from source directories.
 >   * This feature unfortunately is not supported in `Telegram 1.0` and `Air-for-steam` theming.

GtkSourceView/Gedit Color Scheme Support
----------------------------------------
 2 theme files `plata-light.xml` and `plata-dark.xml` are installed by default into `Plata*/gtksourceview` directories.

 > **Note:**
 >
 >   * The color-scheme can be used in Gnome-Builder, Gnome-Sushi, Meld and Gedit if installed to 
 >     `~/.local/share/gtksourceview-3.0/styles` or `~/.local/share/gtksourceview-4/styles` directory.

Extra Browser Support
---------------------
To try our color samples for FirefoxColor test pilot, check these URLs:

  1. [**Plata**](https://color.firefox.com/?theme=XQAAAAL8AAAAAAAAAABBKYhm849SCia2CaaEGccwS-xNKliFvd9NUAF6ENY3kBjKL2oHo45W2-O_o0hH8v9jyb1gPLS8xyg320t5BtQBRbshC37eqwUpEtrNzUXzzCCGCEnPVujOpTgJBqePqVNh4q1nxYUIdLIFaoaGFtpU8UGWTHdYK89VREGS2_uycyNkLyT_fUsp3rt8085FMcIrk2zP6zlQ8nXHifYExWUlXde95kD4F3H_cvgAAA)

  2. [**Plata-Lumine**](https://color.firefox.com/?theme=XQAAAAL8AAAAAAAAAABBKYhm849SCia2CaaEGccwS-xNKliFvd9NUAF6ENY3kBjKL2oHo45W2-O_o0hH8v9jyb1gPLS8xyg3NbO0xf8CWW1IQ-VFBeST-c2ya550Jq-AJT3qXk84PCZgv4Q1Ip6G8KMxah3hVdR8-Zr9ze0kGqgOtR7bn1Nps1cYGNzQQkA8ajSLlQnjaMNzy_Cgfm6TGsTtSGCZPEHAaGevqPSrPV7L_8f2AAA)

  3. [**Plata-Noir**](https://color.firefox.com/?theme=XQAAAAL8AAAAAAAAAABBKYhm849SCia2CaaEGccwS-xNKlhR4U3ii01izoNSwV8EzxA9i34l-h9kNzmmbht5egIz1VwqGu4asy3bC0Iu-fSfcIJAVAwKwUYrdnMCFPHjDRh3WIEk3D10l1b0yhJ2JJ4iidXrDdOeHtPXECgT4mWPRinIv4rInTDn_LmydH4PXIv_OPeKQZiffADmQZvxlSWtpsLQfUznQX8sEtOtxfBaEVM7_-LnUAA)

 > **Note:**
 >
 >   * We no longer support "Normal" UI layout in Chrome(ium). Use "Refresh" instead.
 >
 >   * Vivaldi can make custom themes via settings like these:
 >     ```
 >     Background: #F8F8F8 (#1D1D1D)
 >     Foreground: #111111 (#F5F5F5)
 >     Highlight:  #3F51B5
 >     Accent:     #E7E7E7 (#080808)
 >     Accent Color from Active Page: [ ]
 >     Apply Accent Color to Window:  [*]
 >     Transparent Tabs:              [*]
 >     Corner Rounding:               2px
 >     ```

Extra Dock Support
------------------
 To try "Plank" theming, pass this option:

 ```
 --enable-plank         enable Plank support (type: bool)
 ```

 Then select `Gtk` via `plank --preferences`.

 > **Note:**
 >
 >   * Both Plata and Plata-Noir shares the dark theming, Plata-Lumine uses light theming.
 >   * Don't expect too much. Plank is NOT a themeable widget for me!

Extra Compositor Support
------------------------
 Compton is the famous stand-alone compositor that works well with the Openbox window-manager. The installer installs recommended configuration file `compton.conf` into `Plata/openbox-3` directory if Openbox support is enabled.

 Next, copy that file into `~/.config/` and restart compton to read the settings.  That compositor still has some limitations in its features for Plata, however.

Extra Telegram Support
----------------------
 To try "Telegram 1.0" theming, pass this option:

 ```
 --enable-telegram      enable Telegram 1.0 support (type: bool)
 ```

 The installer installs compressed `tdesktop-theme` files into `Plata*/telegram` directories if Telegram support is enabled.
 Then open the file via Telegram > Main Menu > Settings > Chat background > Choose from file.

 > **Note:**
 >
 >   * The `plata.tdesktop-theme` and `plata-lumine.tdesktop-theme` are for light-variant, and `plata-noir.tdesktop-theme` is for dark-variant.
 >   * Bundled noise-texture images are for *tiled* mode.
 >   * Telegram support is a W.I.P currently.

Extra Tweetdeck Support
-----------------------
 To try "Colordeck for Tweetdeck" extension theming, pass this option:

 ```
 --enable-tweetdeck      enable Tweetdeck-colordeck support (type: bool)
 ```

 The installer installs `cdk` files into `Plata*/tweetdeck` directories if Tweetdeck support is enabled.
 Then open the file via Colordeck -> import > "Colors" -> Choose File.

 > **Note:**
 >
 >   * [**Chrome Web Store**](https://chrome.google.com/webstore/detail/colordeck-for-tweetdeck/jgoilgghdiafcdpgaddhfnlnhjhiejjl)
 >   * [**Firefox Add-ons**](https://addons.mozilla.org/en-US/firefox/addon/colordeck/)
 >   * Mixed and dark variants are supported.
 >   * Currently those files support "Colors" only, so enabling "Colors" checkbox is enough.

Extra Air-for-Steam Support
---------------------------
 To try "Air for Steam" colors and themes, pass this option (dark-variant only):

 ```
 --enable-airforsteam      enable Air-for-Steam support (type: bool)
 ```

 You should veify that you've already installed Air-for-Steam skin to `~/.steam/skins` directory.
 The installer installs 2 files into `Plata-Noir/airforsteam` directory if Air-for-Steam support is enabled:
  * Copy `Resource/colors/plata-noir.styles` to `~/.steam/skins/Air-for-Steam-*/Resource/colors` or
    `~/.steam/skins/Air-for-Steam-*/Resource/colors/user`.
  * Copy `Resource/themes/_plata-noir.styles` to `~/.steam/skins/Air-for-Steam-*/Resource/themes`.

 Edit `~/.steam/skins/Air-for-Steam-*/config.init` to activate those styles, then restart the Steam app.

Work in Progress
----------------

TODO
----

Public License
--------------
 * GPLv2.0 (Codebase)

 * CC BY-SA 4.0 (Asset images)

 > **Note:**
 >
 > And an icon-theme in Cinnamon thumbnails:
 > [**Paper Icons**](http://snwh.org/paper/icons) by Sam Hewitt is licensed under CC-SA-4.0.

Donations
---------

Special Thanks to
--------------
 Nana-4, the developer of Materia (formerly Flat-Plat)

 Sam Hewitt, the developer of Paper-icon theme
