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

gtksourceviewdir   = $(srcdir)/gtksourceview
gtksourceview_noir_file = \
	$(gtksourceviewdir)/plata-dark.xml
gtksourceview_lumine_file = \
	$(gtksourceviewdir)/plata-light.xml

tweetdeckdir          = $(srcdir)/tweetdeck
tweetdeck_lumine_file = $(tweetdeckdir)/light/ColorDeck-light.cdk
tweetdeck_noir_file   = $(tweetdeckdir)/dark/ColorDeck-dark.cdk

# ******************
# * Generate files *
# ******************

all:
if ENABLE_TWEETDECK
	cd $(tweetdeckdir) && ./recolor-cdk.sh
endif

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

	test -e $(noirdir)/gtksourceview && rm -rfv $(noirdir)/gtksourceview
	test -e $(luminedir)/gtksourceview && rm -rfv $(luminedir)/gtksourceview
	test -e $(platadir)/gtksourceview && rm -rfv $(platadir)/gtksourceview

# ****************************
# * Clean up generated files *
# ****************************

CLEANFILES =

if ENABLE_TWEETDECK
CLEANFILES += \
	$(tweetdeckdir)/light/ColorDeck-light.cdk \
	$(tweetdeckdir)/dark/ColorDeck-dark.cdk
endif

DISTCLEANFILES = \
	$(CLEANFILES)