BRANCH ?= debian/2.04-4

.PHONY: all
all: .SRCINFO

.PHONY: .SRCINFO
.SRCINFO:
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

.PHONY: import
import: DIFFTOOL?=$(shell git config --get diff.tool || echo vimdiff)
import: PKGBUILD.import
	$(DIFFTOOL) $< PKGBUILD

.PHONY: PKGBUILD.import
.SILENT: PKGBUILD.import
PKGBUILD.import: PKGBUILD series
	while read -r patch; do \
		$(MAKE) --silent wget_$$patch; \
	done <series
	sed -n -e '/^source=/,/\(^$$\|)$$\)/{/$$/s,),,;p}' PKGBUILD >$@.tmp
	while read -r patch; do \
		printf '        '"'$$patch'"'\n' >>$@.tmp; \
	done <series
	sed -i -e '$$s,$$,),' $@.tmp
	printf '\n' >>$@.tmp
	sed -n -e '/^sha256sums=/,/\(^$$\|)$$\)/{/$$/s,),,;p}' PKGBUILD >>$@.tmp
	while read -r patch; do \
		printf '            '"'$$(sha256sum "$$patch" | awk '{ print $$1 }' )'"'\n' >>$@.tmp; \
	done <series
	sed -i -e '$$s,$$,),' $@.tmp
	printf '\n' >>$@.tmp
	printf 'prepare()\n' >>$@.tmp
	printf '\techo "Patches from debian..."\n' >>$@.tmp
	while read -r patch; do \
		printf '\tpatch -Np1 -i "$${srcdir}/'$$patch'"\n' >>$@.tmp; \
	done <series
	printf '}\n' >>$@.tmp
	printf '\n' >>$@.tmp
	mv $@.tmp $@

series:
	$(MAKE) wget_$@

.PHONY: clean
	rm -f PKGBUILD.import series

wget_%:
	wget https://salsa.debian.org/grub-team/grub/raw/$(BRANCH)/debian/patches/$* -O $*
