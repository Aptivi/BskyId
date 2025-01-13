BINARIES = src/bskyid
MANUALS = src/bskyid.1
DESTDIR = /usr/local

.PHONY: install

install:
	mkdir -m 755 -p $(DESTDIR)/bin $(DESTDIR)/share/man/man1/
	install -m 755 -t $(DESTDIR)/bin/ $(BINARIES)
	install -m 755 -t $(DESTDIR)/share/man/man1/ $(MANUALS)
	gzip $(DESTDIR)/share/man/man1/bskyid.1

# This makefile is just a wrapper for tools scripts.
