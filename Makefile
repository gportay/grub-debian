VERSION ?= 2.04
RELEASE ?= 9
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
PKGBUILD.import: PKGBUILD.backport series
	while read -r patch; do \
		$(MAKE) --silent wget_$$patch; \
		mv $$patch debian-$$patch; \
	done <series
	echo "_pkgver=$(VERSION)" >$@.tmp
	echo "pkgver=\$${_pkgver/-/}" >>$@.tmp
	echo "pkgrel=$(RELEASE)" >>$@.tmp
	echo "epoch=2" >>$@.tmp
	sed -n -e '/^source=/,/\(^$$\|)$$\)/{/$$/s,),,;p}' PKGBUILD.backport >>$@.tmp
	while read -r patch; do \
		printf '        '"'debian-$$patch'"'\n' >>$@.tmp; \
	done <series
	sed -i -e '$$s,$$,),' $@.tmp
	printf '\n' >>$@.tmp
	sed -n -e '/^sha256sums=/,/\(^$$\|)$$\)/{/$$/s,),,;p}' PKGBUILD.backport >>$@.tmp
	while read -r patch; do \
		printf '            '"'$$(sha256sum "debian-$$patch" | awk '{ print $$1 }' )'"'\n' >>$@.tmp; \
	done <series
	sed -i -e '$$s,$$,),' $@.tmp
	printf '\n' >>$@.tmp
	printf 'prepare()\n' >>$@.tmp
	printf '\techo "Patches from debian..."\n' >>$@.tmp
	while read -r patch; do \
		printf '\tpatch -Np1 -i "$${srcdir}/'debian-$$patch'"\n' >>$@.tmp; \
	done <series
	printf '}\n' >>$@.tmp
	printf '\n' >>$@.tmp
	mv $@.tmp $@

PKGBUILD.backport grub.default.backport:

.PHONY: backport
backport: PKGBUILD.backport grub.default.backport
	for file in $^; do \
		$(DIFFTOOL) $$file $${file%.backport}; \
	done
	$(MAKE) updpkgsums

series:
	$(MAKE) wget_$@

.PHONY: clean
clean:
	rm -f PKGBUILD.backport PKGBUILD.import series

%.backport:
	$(MAKE) wget_$*.backport

wget_%.backport:
	wget https://git.archlinux.org/svntogit/packages.git/plain/repos/core-x86_64/$*?h=packages/grub -O $*.backport

wget_%:
	wget https://salsa.debian.org/grub-team/grub/raw/$(BRANCH)/debian/patches/$* -O $*
