BINARIES = src/bskyid
MANUALS = src/bskyid.1

.PHONY: debian-install

# Below targets are for Debian packaging only

debian-install:
	mkdir -m 755 -p debian/bskyid/usr/bin
	install -m 755 -t debian/bskyid/usr/bin/ $(BINARIES)
	install -m 755 -t debian/ $(MANUALS)

# This makefile is just a wrapper for tools scripts.
