VERSION = 0.1
PREFIX ?= /usr
SRC = archive_extractor.sh

all:

release: 
	mkdir -p archive_extractor-${VERSION}
	cp -R LICENSE Makefile README.md ${SRC} archive_extractor-${VERSION}
	tar -cf archive_extractor-${VERSION}.tar archive_extractor-${VERSION}
	gzip archive_extractor-${VERSION}.tar
	rm -rf archive_extractor-${VERSION}

install: 
	mkdir -p ${DESTDIR}${PREFIX}/bin
	cp -f archive_extractor.sh ${DESTDIR}${PREFIX}/bin/archive_extractor
	chmod 755 ${DESTDIR}${PREFIX}/bin/archive_extractor

uninstall:
	rm -fr ${DESTDIR}${PREFIX}/bin/archive_extractor

.PHONY: all release install uninstall
