BRANCH ?= debian/2.04-5
DIFFTOOL ?= $(shell git config --get diff.tool || echo vimdiff)

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
import: PKGBUILD.import
	$(DIFFTOOL) $< PKGBUILD

.PHONY: PKGBUILD.import
.SILENT: PKGBUILD.import
PKGBUILD.import: PKGBUILD.backport series
	while read -r patch; do \
		$(MAKE) --silent wget_$$patch; \
	done <series
	sed -n -e '/^source=/,/\(^$$\|)$$\)/{/$$/s,),,;p}' PKGBUILD.backport >$@.tmp
	while read -r patch; do \
		printf '        '"'$$patch'"'\n' >>$@.tmp; \
	done <series
	sed -i -e '$$s,$$,),' $@.tmp
	printf '\n' >>$@.tmp
	sed -n -e '/^sha256sums=/,/\(^$$\|)$$\)/{/$$/s,),,;p}' PKGBUILD.backport >>$@.tmp
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

PKGBUILD.backport grub.default.backport:

.PHONY: backport
backport: PKGBUILD.backport grub.default.backport
	for file in $^; do \
		$(DIFFTOOL) $$file $${file%.backport}; \
	done

series:
	$(MAKE) wget_$@

.PHONY: clean
clean:
	rm -f PKGBUILD.import series

%.backport:
	$(MAKE) wget_$*.backport

wget_%.backport:
	wget https://git.archlinux.org/svntogit/packages.git/plain/repos/core-x86_64/$*?h=packages/grub -O $*.backport

wget_%:
	wget https://salsa.debian.org/grub-team/grub/raw/$(BRANCH)/debian/patches/$* -O $*
