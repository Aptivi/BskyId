BINARIES = src/bskyid
MANUALS = src/bskyid.1

ifndef DESTDIR
FDESTDIR := /usr/local
else
FDESTDIR := $(DESTDIR)/usr
endif

.PHONY: install

install:
	mkdir -m 755 -p $(FDESTDIR)/bin $(FDESTDIR)/share/man/man1/
	install -m 755 -t $(FDESTDIR)/bin/ $(BINARIES)
	install -m 644 -t $(FDESTDIR)/share/man/man1/ $(MANUALS)

# This makefile is just a wrapper for tools scripts.
