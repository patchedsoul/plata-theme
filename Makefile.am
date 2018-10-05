ACLOCAL_AMFLAGS = -I m4

themedir         = $(datadir)/themes
platadir         = $(DESTDIR)$(themedir)/Plata
luminedir        = $(DESTDIR)$(themedir)/Plata-Lumine
noirdir          = $(DESTDIR)$(themedir)/Plata-Noir
platacompactdir  = $(DESTDIR)$(themedir)/Plata-Compact
luminecompactdir = $(DESTDIR)$(themedir)/Plata-Lumine-Compact
noircompactdir   = $(DESTDIR)$(themedir)/Plata-Noir-Compact

SUBDIRS = \
	src/gtk \
	src/shell \
	src/wm \
	src/extra \
	data

EXTRA_DIST = \
	COPYING \
	LICENSE_CC_BY_SA4

install-data-hook:
	cp -Rv $(EXTRA_DIST) $(platadir)

uninstall-hook:
	test -e $(noirdir) && rm -rfv $(noirdir)
	test -e $(luminedir) && rm -rfv $(luminedir)
	test -e $(platadir) && rm -rfv $(platadir)
	test -e $(noircompactdir) && rm -rfv $(noircompactdir)
	test -e $(luminecompactdir) && rm -rfv $(luminecompactdir)
	test -e $(platacompactdir) && rm -rfv $(platacompactdir)
