themedir         = $(datadir)/themes
platadir         = $(DESTDIR)$(themedir)/Plata
luminedir        = $(DESTDIR)$(themedir)/Plata-Lumine
noirdir          = $(DESTDIR)$(themedir)/Plata-Noir
platacompactdir  = $(DESTDIR)$(themedir)/Plata-Compact
luminecompactdir = $(DESTDIR)$(themedir)/Plata-Lumine-Compact
noircompactdir   = $(DESTDIR)$(themedir)/Plata-Noir-Compact

plankdir          = $(srcdir)/plank
plank_lumine_file = $(plankdir)/dock-light.theme
plank_noir_file   = $(plankdir)/dock-dark.theme

telegramdir          = $(srcdir)/telegram
telegram_file        = $(telegramdir)/plata.tdesktop-theme
telegram_lumine_file = $(telegramdir)/plata-lumine.tdesktop-theme
telegram_noir_file   = $(telegramdir)/plata-noir.tdesktop-theme

tweetdeckdir          = $(srcdir)/tweetdeck
tweetdeck_lumine_file = $(tweetdeckdir)/light/ColorDeck-light.cdk
tweetdeck_noir_file   = $(tweetdeckdir)/dark/ColorDeck-dark.cdk

airdir              = $(srcdir)/airforsteam
air_dark_color_file = $(airdir)/Resource/colors/plata-noir.styles
air_dark_theme_file = $(airdir)/Resource/themes/_plata-noir.styles

gtksourceviewdir   = $(srcdir)/gtksourceview
gtksourceview_noir_file = \
	$(gtksourceviewdir)/plata-dark.xml
gtksourceview_lumine_file = \
	$(gtksourceviewdir)/plata-light.xml

# ******************
# * Generate files *
# ******************

all:
if ENABLE_TWEETDECK
	cd $(tweetdeckdir) && ./recolor-cdk.sh
endif

if ENABLE_TELEGRAM
	cd $(telegramdir) && ./recolor-telegram.sh

	cd $(telegramdir)/mixed && $(ZIP) --strip-extra -o ../plata.tdesktop-theme \
		./colors.tdesktop-theme ./tiled.png
	cd $(telegramdir)/light && $(ZIP) --strip-extra -o ../plata-lumine.tdesktop-theme \
		./colors.tdesktop-theme ./tiled.png
	cd $(telegramdir)/dark && $(ZIP) --strip-extra -o ../plata-noir.tdesktop-theme \
		./colors.tdesktop-theme ./tiled.png
endif

if ENABLE_AIRFORSTEAM
	cd $(airdir) && ./recolor-air.sh
endif

	cd $(gtksourceviewdir) && ./recolor-gtksourceview.sh

# *****************
# * Install files *
# *****************

install-data-local:
if ENABLE_PLANK
	$(MKDIR_P) $(platadir)/plank
	$(MKDIR_P) $(luminedir)/plank
	$(MKDIR_P) $(noirdir)/plank
	$(MKDIR_P) $(platacompactdir)/plank
	$(MKDIR_P) $(luminecompactdir)/plank
	$(MKDIR_P) $(noircompactdir)/plank
	cp -Rv $(plank_noir_file) $(platadir)/plank/dock.theme
	cp -Rv $(plank_lumine_file) $(luminedir)/plank/dock.theme
	cp -Rv $(plank_noir_file) $(noirdir)/plank/dock.theme
	cp -Rv $(plank_noir_file) $(platacompactdir)/plank/dock.theme
	cp -Rv $(plank_lumine_file) $(luminecompactdir)/plank/dock.theme
	cp -Rv $(plank_noir_file) $(noircompactdir)/plank/dock.theme
endif

if ENABLE_TELEGRAM
	$(MKDIR_P) $(platadir)/telegram
	$(MKDIR_P) $(luminedir)/telegram
	$(MKDIR_P) $(noirdir)/telegram
	cp -Rv $(telegram_file) $(platadir)/telegram
	cp -Rv $(telegram_lumine_file) $(luminedir)/telegram
	cp -Rv $(telegram_noir_file) $(noirdir)/telegram
endif

if ENABLE_TWEETDECK
	$(MKDIR_P) $(platadir)/tweetdeck
	$(MKDIR_P) $(luminedir)/tweetdeck
	$(MKDIR_P) $(noirdir)/tweetdeck
	cp -Rv $(tweetdeck_lumine_file) $(platadir)/tweetdeck
	cp -Rv $(tweetdeck_lumine_file) $(luminedir)/tweetdeck
	cp -Rv $(tweetdeck_noir_file) $(noirdir)/tweetdeck
endif

if ENABLE_AIRFORSTEAM
	$(MKDIR_P) $(noirdir)/airforsteam/Resource/colors
	$(MKDIR_P) $(noirdir)/airforsteam/Resource/themes
	cp -Rv $(air_dark_color_file) $(noirdir)/airforsteam/Resource/colors
	cp -Rv $(air_dark_theme_file) $(noirdir)/airforsteam/Resource/themes
endif

	$(MKDIR_P) $(platadir)/gtksourceview
	$(MKDIR_P) $(luminedir)/gtksourceview
	$(MKDIR_P) $(noirdir)/gtksourceview
	cp -Rv $(gtksourceview_noir_file) $(platadir)/gtksourceview
	cp -Rv $(gtksourceview_lumine_file) $(luminedir)/gtksourceview
	cp -Rv $(gtksourceview_noir_file) $(noirdir)/gtksourceview

# *******************
# * Uninstall files *
# *******************

uninstall-local:
if ENABLE_PLANK
	test -e $(noirdir)/plank && rm -rfv $(noirdir)/plank
	test -e $(luminedir)/plank && rm -rfv $(luminedir)/plank
	test -e $(platadir)/plank && rm -rfv $(platadir)/plank
	test -e $(noircompactdir)/plank && rm -rfv $(noircompactdir)/plank
	test -e $(luminecompactdir)/plank && rm -rfv $(luminecompactdir)/plank
	test -e $(platacompactdir)/plank && rm -rfv $(platacompactdir)/plank
endif

if ENABLE_TELEGRAM
	test -e $(noirdir)/telegram && rm -rfv $(noirdir)/telegram
	test -e $(luminedir)/telegram && rm -rfv $(luminedir)/telegram
	test -e $(platadir)/telegram && rm -rfv $(platadir)/telegram
endif

if ENABLE_TWEETDECK
	test -e $(noirdir)/tweetdeck && rm -rfv $(noirdir)/tweetdeck
	test -e $(luminedir)/tweetdeck && rm -rfv $(luminedir)/tweetdeck
	test -e $(platadir)/tweetdeck && rm -rfv $(platadir)/tweetdeck
endif

if ENABLE_AIRFORSTEAM
	test -e $(noirdir)/airforsteam && rm -rfv $(noirdir)/airforsteam
endif

	test -e $(noirdir)/gtksourceview && rm -rfv $(noirdir)/gtksourceview
	test -e $(luminedir)/gtksourceview && rm -rfv $(luminedir)/gtksourceview
	test -e $(platadir)/gtksourceview && rm -rfv $(platadir)/gtksourceview

# ****************************
# * Clean up generated files *
# ****************************

CLEANFILES = \
	$(gtksourceviewdir)/plata-light.xml \
	$(gtksourceviewdir)/plata-dark.xml

if ENABLE_TWEETDECK
CLEANFILES += \
	$(tweetdeckdir)/light/ColorDeck-light.cdk \
	$(tweetdeckdir)/dark/ColorDeck-dark.cdk
endif

if ENABLE_TELEGRAM
CLEANFILES += \
	$(telegramdir)/light/colors.tdesktop-theme \
	$(telegramdir)/mixed/colors.tdesktop-theme \
	$(telegramdir)/dark/colors.tdesktop-theme \
	$(telegramdir)/plata.tdesktop-theme \
	$(telegramdir)/plata-lumine.tdesktop-theme \
	$(telegramdir)/plata-noir.tdesktop-theme
endif

if ENABLE_AIRFORSTEAM
CLEANFILES += \
	$(airdir)/Resource/colors/plata-noir.styles
endif

DISTCLEANFILES = \
	$(CLEANFILES)
