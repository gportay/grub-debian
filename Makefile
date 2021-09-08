VERSION ?= 2.04
RELEASE ?= 20
BRANCH ?= debian/$(VERSION)-$(RELEASE)
DIFFTOOL ?= $(shell git config --get diff.tool || echo vimdiff)

.PHONY: all
all: .SRCINFO

.PHONY: .SRCINFO
.SRCINFO: updpkgsums
	makepkg --printsrcinfo >$@

.PHONY: repackage
repackage:
	makepkg --repackage --force

.PHONY: nobuild
nobuild:
	makepkg --cleanbuild --nobuild

.PHONY: build
build:
	makepkg --cleanbuild --force

.PHONY: updpkgsums
updpkgsums:
	updpkgsums

.PHONY: import
import: PKGBUILD.import
	$(DIFFTOOL) $< PKGBUILD
	$(MAKE) updpkgsums

.PHONY: PKGBUILD.import
.SILENT: PKGBUILD.import
PKGBUILD.import: SHELL = /bin/bash
PKGBUILD.import: archlinux/PKGBUILD debian/series
	while read -r patch; do \
		$(MAKE) --silent debian/$$patch || exit 1; \
		ln -sf debian/$$patch debian-$${patch//\//-} || exit 1; \
	done <debian/series
	echo "_pkgver=$(VERSION)" >$@.tmp
	echo "pkgver=\$${_pkgver/-/}" >>$@.tmp
	echo "pkgrel=$(RELEASE)" >>$@.tmp
	echo "epoch=2" >>$@.tmp
	sed -n -e '/^source=/,/\(^$$\|)$$\)/{/$$/s,),,;p}' archlinux/PKGBUILD >>$@.tmp
	while read -r patch; do \
		printf '        '"'debian-$${patch//\//-}'"'\n' >>$@.tmp; \
	done <debian/series
	sed -i -e '$$s,$$,),' $@.tmp
	printf '\n' >>$@.tmp
	sed -n -e '/^sha256sums=/,/\(^$$\|)$$\)/{/$$/s,),,;p}' archlinux/PKGBUILD >>$@.tmp
	while read -r patch; do \
		printf '            '"'$$(sha256sum "debian-$${patch//\//-}" | awk '{ print $$1 }' )'"'\n' >>$@.tmp; \
	done <debian/series
	sed -i -e '$$s,$$,),' $@.tmp
	printf '\n' >>$@.tmp
	printf 'prepare()\n' >>$@.tmp
	printf '\techo "Patches from debian..."\n' >>$@.tmp
	while read -r patch; do \
		printf '\tpatch -Np1 -i "$${srcdir}/'debian-$${patch//\//-}'"\n' >>$@.tmp; \
	done <debian/series
	printf '}\n' >>$@.tmp
	printf '\n' >>$@.tmp
	mv $@.tmp $@

.PHONY: backport
backport: archlinux/PKGBUILD archlinux/grub.default
	for file in $^; do \
		$(DIFFTOOL) $$file $${file#archlinux/}; \
	done
	$(MAKE) updpkgsums

.PHONY: clean
clean:
	rm -Rf archlinux/ PKGBUILD.import debian/series

archlinux/%:
	mkdir -p archlinux/$(*D)
	wget https://raw.githubusercontent.com/archlinux/svntogit-packages/master/grub/repos/core-x86_64/$* -O archlinux/$*

debian/%:
	mkdir -p debian/$(*D)
	wget https://salsa.debian.org/grub-team/grub/raw/$(BRANCH)/debian/patches/$* -O debian/$*
