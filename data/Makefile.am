themedir         = $(datadir)/themes
platadir         = $(DESTDIR)$(themedir)/Plata
luminedir        = $(DESTDIR)$(themedir)/Plata-Lumine
noirdir          = $(DESTDIR)$(themedir)/Plata-Noir
platacompactdir  = $(DESTDIR)$(themedir)/Plata-Compact
luminecompactdir = $(DESTDIR)$(themedir)/Plata-Lumine-Compact
noircompactdir   = $(DESTDIR)$(themedir)/Plata-Noir-Compact

index_file               = $(srcdir)/index.theme
index_light_file         = $(srcdir)/index.theme-light
index_dark_file          = $(srcdir)/index.theme-dark
index_compact_file       = $(srcdir)/index.theme-compact
index_light_compact_file = $(srcdir)/index.theme-light-compact
index_dark_compact_file  = $(srcdir)/index.theme-dark-compact

# ******************
# * Generate files *
# ******************

all:

# *****************
# * Install files *
# *****************

install-data-local:
	cp -Rv $(index_file) $(platadir)/index.theme
	cp -Rv $(index_light_file) $(luminedir)/index.theme
	cp -Rv $(index_dark_file) $(noirdir)/index.theme
	cp -Rv $(index_compact_file) $(platacompactdir)/index.theme
	cp -Rv $(index_light_compact_file) $(luminecompactdir)/index.theme
	cp -Rv $(index_dark_compact_file) $(noircompactdir)/index.theme

# *******************
# * Uninstall files *
# *******************

uninstall-local:
	test -e $(noirdir)/index.theme && rm -rfv $(noirdir)/index.theme
	test -e $(luminedir)/index.theme && rm -rfv $(luminedir)/index.theme
	test -e $(platadir)/index.theme && rm -rfv $(platadir)/index.theme
	test -e $(noircompactdir)/index.theme && rm -rfv $(noircompactdir)/index.theme
	test -e $(luminecompactdir)/index.theme && rm -rfv $(luminecompactdir)/index.theme
	test -e $(platacompactdir)/index.theme && rm -rfv $(platacompactdir)/index.theme

# ****************************
# * Clean up generated files *
# ****************************

CLEANFILES =

DISTCLEANFILES = \
	$(CLEANFILES)
