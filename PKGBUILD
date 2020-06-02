# Maintainer : Christian Hesse <mail@eworm.de>
# Maintainer : Ronald van Haren <ronald.archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Gaël PORTAY <gael.portay@collabora.com>

## "1" to enable IA32-EFI build in Arch x86_64, "0" to disable
_IA32_EFI_IN_ARCH_X64="1"

## "1" to enable EMU build, "0" to disable
_GRUB_EMU_BUILD="0"

_GRUB_EXTRAS_COMMIT="8a245d5c1800627af4cefa99162a89c7a46d8842"
_GNULIB_COMMIT="be584c56eb1311606e5ea1a36363b97bddb6eed3"
_UNIFONT_VER="12.1.03"

[[ "${CARCH}" == "x86_64" ]] && _EFI_ARCH="x86_64"
[[ "${CARCH}" == "i686" ]] && _EFI_ARCH="i386"

[[ "${CARCH}" == "x86_64" ]] && _EMU_ARCH="x86_64"
[[ "${CARCH}" == "i686" ]] && _EMU_ARCH="i386"

pkgname='grub-debian'
pkgdesc='GNU GRand Unified Bootloader (2) with patches from Debian'
_pkgver=2.04
pkgver=${_pkgver/-/}
pkgrel=7.1
epoch=2
url='https://www.gnu.org/software/grub/'
arch=('x86_64')
license=('GPL3')
backup=('etc/default/grub'
        'etc/grub.d/40_custom')
install="${pkgname%-debian}.install"
options=('!makeflags')

conflicts=('grub-common' 'grub-bios' 'grub-emu' "grub-efi-${_EFI_ARCH}" 'grub-legacy' "${pkgname%-debian}")
replaces=('grub-common' 'grub-bios' 'grub-emu' "grub-efi-${_EFI_ARCH}" "${pkgname%-debian}")
provides=('grub-common' 'grub-bios' 'grub-emu' "grub-efi-${_EFI_ARCH}" "${pkgname%-debian}")

makedepends=('git' 'rsync' 'xz' 'freetype2' 'ttf-dejavu' 'python' 'autogen'
             'texinfo' 'help2man' 'gettext' 'device-mapper' 'fuse2')
depends=('sh' 'xz' 'gettext' 'device-mapper')
optdepends=('freetype2: For grub-mkfont usage'
            'fuse2: For grub-mount usage'
            'dosfstools: For grub-mkrescue FAT FS and EFI support'
            'efibootmgr: For grub-install EFI support'
            'libisoburn: Provides xorriso for generating grub rescue iso using grub-mkrescue'
            'os-prober: To detect other OSes when generating grub.cfg in BIOS systems'
            'mtools: For grub-mkrescue FAT FS support')

if [[ "${_GRUB_EMU_BUILD}" == "1" ]]; then
    makedepends+=('libusbx' 'sdl')
    optdepends+=('libusbx: For grub-emu USB support'
                 'sdl: For grub-emu SDL support')
fi

validpgpkeys=('E53D497F3FA42AD8C9B4D1E835A93B74E82E4209'  # Vladimir 'phcoder' Serbinenko <phcoder@gmail.com>
              'BE5C23209ACDDACEB20DB0A28C8189F1988C2166'  # Daniel Kiper <dkiper@net-space.pl>
              '95D2E9AB8740D8046387FD151A09227B1F435A33') # Paul Hardy <unifoundry@unifoundry.com>

source=("git+https://git.savannah.gnu.org/git/grub.git#tag=grub-${_pkgver}?signed"
        "git+https://git.savannah.gnu.org/git/grub-extras.git#commit=${_GRUB_EXTRAS_COMMIT}"
        "git+https://git.savannah.gnu.org/git/gnulib.git#commit=${_GNULIB_COMMIT}"
        "https://ftp.gnu.org/gnu/unifont/unifont-${_UNIFONT_VER}/unifont-${_UNIFONT_VER}.bdf.gz"{,.sig}
        '0003-10_linux-detect-archlinux-initramfs.patch'
        '0004-add-GRUB_COLOR_variables.patch'
        '0005-grub-install-fix-inverted-test-for-NLS-enabled-when-.patch'
        'grub-recordfail.service'
        'grub.default'
        'debian-olpc-prefix-hack.patch'
        'debian-core-in-fs.patch'
        'debian-dpkg-version-comparison.patch'
        'debian-grub-legacy-0-based-partitions.patch'
        'debian-disable-floppies.patch'
        'debian-grub.cfg-400.patch'
        'debian-gfxpayload-keep-default.patch'
        'debian-install-stage2-confusion.patch'
        'debian-mkrescue-efi-modules.patch'
        'debian-mkconfig-loopback.patch'
        'debian-restore-mkdevicemap.patch'
        'debian-gettext-quiet.patch'
        'debian-install-efi-fallback.patch'
        'debian-mkconfig-ubuntu-recovery.patch'
        'debian-install-locale-langpack.patch'
        'debian-mkconfig-nonexistent-loopback.patch'
        'debian-no-insmod-on-sb.patch'
        'debian-default-grub-d.patch'
        'debian-blacklist-1440x900x32.patch'
        'debian-uefi-firmware-setup.patch'
        'debian-mkconfig-ubuntu-distributor.patch'
        'debian-linuxefi.patch'
        'debian-mkconfig-signed-kernel.patch'
        'debian-install-signed.patch'
        'debian-sleep-shift.patch'
        'debian-wubi-no-windows.patch'
        'debian-maybe-quiet.patch'
        'debian-install-efi-adjust-distributor.patch'
        'debian-quick-boot.patch'
        'debian-quick-boot-lvm.patch'
        'debian-gfxpayload-dynamic.patch'
        'debian-vt-handoff.patch'
        'debian-probe-fusionio.patch'
        'debian-ignore-grub_func_test-failures.patch'
        'debian-mkconfig-recovery-title.patch'
        'debian-install-powerpc-machtypes.patch'
        'debian-ieee1275-clear-reset.patch'
        'debian-ppc64el-disable-vsx.patch'
        'debian-grub-install-pvxen-paths.patch'
        'debian-insmod-xzio-and-lzopio-on-xen.patch'
        'debian-grub-install-extra-removable.patch'
        'debian-mkconfig-other-inits.patch'
        'debian-zpool-full-device-name.patch'
        'debian-net-read-bracketed-ipv6-addr.patch'
        'debian-bootp-new-net_bootp6-command.patch'
        'debian-efinet-uefi-ipv6-pxe-support.patch'
        'debian-bootp-process-dhcpack-http-boot.patch'
        'debian-efinet-set-network-from-uefi-devpath.patch'
        'debian-efinet-set-dns-from-uefi-proto.patch'
        'debian-fix-lockdown.patch'
        'debian-skip-grub_cmd_set_date.patch'
        'debian-bash-completion-drop-have-checks.patch'
        'debian-at_keyboard-module-init.patch'
        'debian-uefi-secure-boot-cryptomount.patch'
        'debian-vsnprintf-upper-case-hex.patch'
        'debian-efi-variable-storage-minimise-writes.patch'
        'debian-no-devicetree-if-secure-boot.patch'
        'debian-grub-install-removable-shim.patch'
        'debian-sparc64-fix-bios-boot-partition-support.patch'
        'debian-verifiers-blocklist-fallout.patch'
        'debian-btrfs-raid1c34.patch'
        '0001-Fix-Output-a-menu-entry-for-firmware-setup-on-UEFI-F.patch')

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '6067bda8daa1f3c49d8876107992e19fc9ab905ad54c01c3131b9649977c3746'
            'SKIP'
            '8dc5e5fe0dba842127cec88046cf505cdda08859d30acc18e4f72149d45bcdb2'
            '01b8d51914c4cd9914030b124e57097c1dc153d5cbad031a00470e891d5055db'
            '06820004912a3db195a76e68b376fce1ba6507ac740129f0b99257ef07aba1ea'
            '65d41c0bcb933cf06060082b60571ba6c4e40b873e13117fca5708101e7182c2'
            '690adb7943ee9fedff578a9d482233925ca3ad3e5a50fffddd27cf33300a89e3'
            '417fb948234b9f1a7b466a88ec9aef51e9409131f375fc2bacd9216504088b14'
            'be150109b09f937a9c70174d2ec7a4f38add4125908842219d3d8f8abc9619a6'
            '418a1b11549ffaa5b96f974916d36b5d00f003ed58631fdd199f96bb7cf925ea'
            '40dfa6adfdf4638a72ee87c8e2ff2fbdcaf41e81dca5e330e53a1c87ecff8eaf'
            '39691deec693addac7ec6bcaecd24b6917884034d32742d58410f17d48174baa'
            '95d7a502e81330268e05b8fb0fd9021f48b44f9d843a5b24197c15f272ae6c5e'
            '2f7e94dd9206092881df157141794ac8e8559ee95643db165f212e6f8e266222'
            '0de512ee0436cb28c0d5d055da43fd20c355d11c322931ea8ba5568a15c242ce'
            '90be90bbd604875e17a4d97b6689b94d7c8b695f17a4eb917fe62fc0e09bdb6d'
            'bf84445900797c5a1d4605a0c750e24e285d98b124ce0b78400bd21294709a37'
            '978c0dbbbfc210f251b6fffbe8da630330769decb059f81ef5c3e43a4ed4e048'
            '52bdaaea2596b93666a3470ee354f5f20db1fdca5e6c6765ac5a32e4a8c26345'
            'b2b2c805e308c62198ed81428f2c6f143d0da1f48a0e6562c3f0467e34e2dcf8'
            'aef21376173bce3c85dc2153ff0fb8c1366e8b119a492dd4e87e10578e4f95cb'
            '5b4a5d64ab5808b966df54b42ab5066cd46062814d0c9f547c752afb148c5c39'
            '6629ad6d22d2877b457014ee28fd8d36f35fb0250846127d34aaf41ba2781c8a'
            '20421086de64dbcaa1790ee1f40e30b6337f7b0f7180506d493a94165af65a8d'
            '522c0b3024973a24cd04434d4b8b3fd8e223c8358dfe304753f08b8258e3bb3f'
            '7afefd1e0afb21924e2207cc644f6fd30b8cab7364fe24864df1bf64e054d61d'
            '678af2e3b9c68a4fbdb54c9e789072759cbdceefe7843fa1f05942b1c483b4fa'
            'f9e204a019f0ca2acca826ae98540d099497272402d5d934d0b44d1a533b8403'
            '8210af34ccca0b67697206b124f646ca88093899d73dd0911c506e51d13204a1'
            '2a71f86bf11c8fad0f6a3301d22b7d9e6341585d39814dddc21ea995765bb972'
            '2c694056ba49cda162a3e5b72914ce8935b0e09b09e8ddcbf28c019b46872d7b'
            '64ceb7d3be5d221fbad33f91013d6ddfbc15d7094bf2f20e0300eab4a643621b'
            'da1d54da56b1175c41f7ea5ed55c7d305b714b61eb10361bd50dd402fd66628f'
            '4560286dfe5afe95afa91a8d46aa36a3fd10ad2bf6b7c7847bb19084c3a4c640'
            '26f815c4ac19100aa75a0dbd2fa2cc8ae1a0be38e9ae09c8e72d1eda3baf56a9'
            'dd396c05333d1551c19531dc06fab446980cdf5920cbca85f2a835d5d1910f69'
            '3f3936df78b71cec700116457d6d2a5c089d49325ec7aa8fad35f94312d6f917'
            '1d642167faae6d2d5cfd54618a1a684724a11d049baa0ee389f6ccb8a58a7896'
            'f514b17eb9e21d305927bc8c0eb033bb9eaa5814f626ad183a4f3a9ffb6a5358'
            '0b71ab17279c1c700a4c4e64317feaece8d97500c59719a011b10c270e48e8f6'
            '07b4dfe8550930f76d224a999923c3d4bf5f5871fa5c6914dfe90d0079d25622'
            'b9819422f62c0471cd7fb21782d9d480224286df1cf32e7cc3a8fc313b46dfb2'
            '7dbf5c8bf695422b109963d44f88c5947748498a13f66bc0bcb8b2e80fc7b27a'
            '4bc3f581363225c4a7c9d5e6d3238bd96ddb06ecdac2c8e6e4de6d9504389e2b'
            '61f422db46a9642656cbaebaad674a58952c25e4ab0dc5f93e20be4a9fc250c4'
            '8672a82d06e53d17b5cbb599151c7e48b6b789da7ad4925a5733b754261b4554'
            'f9ef7d3d4c39549f73643ff1a28719c09dc7dd01fa2285158fe4347b8645017d'
            '9ed0a6dd4f557c7342ffb9bd7ec0e3aa80df39182c13d4d7f1900ed45c77a38b'
            'f83c19cdf398e5a3c0ddab722566d9e1753a68a5177663ff6944451a40454230'
            'f54f6558eb17affdce9974f7917ef5ef28afb675faa1b7de066d048aa9f36205'
            'c578ffc0481e2c99ee16ce9f256f578eef0976789eca3977bcd0e0fc027b2efa'
            'ab8d1a620a1b7ab6f93c8cea67b25b52975d502526d403a9ed8e847b3710ac4d'
            '22fae003a69c01e25708d4463eed29e4b3e0fa462ca1a2d76fd5890bad5c86dd'
            'e72293785764e506506ad59dd46ce162ac73384cb4da120b4823998e682b6a97'
            'dc01caea3c829c8afc265f709acc0b3cf8b9796c37dd9d9832ffe27757c25cef'
            '22754f2d2ec7b2953bc2c91280a388d1d36a60c5f48ba63306a6fa3941eef39c'
            '1f318d66edc8b22d9b51f3bef5654b4a6f8c7ea61fe3aa1ffeb72db0b1f9998d'
            '9a14439fbe608b638ef2466706bf2f4ac8d4c2e22986a32d03b34e472eeb9dff'
            'cf0fa7c6a236f5cd72cece363bb64cb06678a9f6737d351e7dc2c614e3095523'
            'e0f2f5b3e97088f23294deae56a61c8a0ef104de0b97469347ed682813827b45'
            'c8baf1fc62b3e55014fe6fd29acec749164ca09007cb51fd426271719e88cf38'
            '7428ab80b33f6ffec1397a2701deb13fd61fc246d21cd7c64457b02e57d6b7a1'
            'e49f107bbb8d161c49610c918f03dd37a89b13b373e767b4db3971046225d955'
            '75e2fbe4de204fe7fb3ff67a84edbb49e14c3161fc5da09e1f0bb0bc559ed6fe'
            'fef6dfb6ca281e0db7d41bca49c252cb49429262c5d892b25dd2dfb79fe72cd5'
            'dd9b47ad5d2071ea382dde3c763775c2a5c901414adc1c16c539481707bae9e3'
            '4bc40d51095df9903659bb623263764cd67771b73af5995c9584a1b332b90a4a'
            'b41ab55426ae5c7c2a7738ea6c66543078101c4a27ff3e54cac7ff2bb74d4683'
            'c3cf7da6d76df20137198c867bc9a1eb6b425204569b4b945b48bc9a6d82d9e0')

_backports=(
	# grub-mkconfig: Use portable "command -v" to detect installed programs
	'28a7e597de0d5584f65e36f9588ff9041936e617'
)

_configure_options=(
	FREETYPE="pkg-config freetype2"
	BUILD_FREETYPE="pkg-config freetype2"
	--enable-mm-debug
	--enable-nls
	--enable-device-mapper
	--enable-cache-stats
	--enable-grub-mkfont
	--enable-grub-mount
	--prefix="/usr"
	--bindir="/usr/bin"
	--sbindir="/usr/bin"
	--mandir="/usr/share/man"
	--infodir="/usr/share/info"
	--datarootdir="/usr/share"
	--sysconfdir="/etc"
	--program-prefix=""
	--with-bootdir="/boot"
	--with-grubdir="grub"
	--disable-silent-rules
	--enable-quiet-boot
	--disable-quick-boot
	--disable-werror
)

prepare() {
	cd "${srcdir}/grub/"

	echo "Apply backports..."
	local _c
	for _c in "${_backports[@]}"; do
		git log --oneline -1 "${_c}"
		git cherry-pick -n "${_c}"
	done

	echo "Patches from debian..."
	patch -Np1 -i "${srcdir}/debian-olpc-prefix-hack.patch"
	patch -Np1 -i "${srcdir}/debian-core-in-fs.patch"
	patch -Np1 -i "${srcdir}/debian-dpkg-version-comparison.patch"
	patch -Np1 -i "${srcdir}/debian-grub-legacy-0-based-partitions.patch"
	patch -Np1 -i "${srcdir}/debian-disable-floppies.patch"
	patch -Np1 -i "${srcdir}/debian-grub.cfg-400.patch"
	patch -Np1 -i "${srcdir}/debian-gfxpayload-keep-default.patch"
	patch -Np1 -i "${srcdir}/debian-install-stage2-confusion.patch"
	patch -Np1 -i "${srcdir}/debian-mkrescue-efi-modules.patch"
	patch -Np1 -i "${srcdir}/debian-mkconfig-loopback.patch"
	patch -Np1 -i "${srcdir}/debian-restore-mkdevicemap.patch"
	patch -Np1 -i "${srcdir}/debian-gettext-quiet.patch"
	patch -Np1 -i "${srcdir}/debian-install-efi-fallback.patch"
	patch -Np1 -i "${srcdir}/debian-mkconfig-ubuntu-recovery.patch"
	patch -Np1 -i "${srcdir}/debian-install-locale-langpack.patch"
	patch -Np1 -i "${srcdir}/debian-mkconfig-nonexistent-loopback.patch"
	patch -Np1 -i "${srcdir}/debian-no-insmod-on-sb.patch"
	patch -Np1 -i "${srcdir}/debian-default-grub-d.patch"
	patch -Np1 -i "${srcdir}/debian-blacklist-1440x900x32.patch"
	patch -Np1 -i "${srcdir}/debian-uefi-firmware-setup.patch"
	patch -Np1 -i "${srcdir}/debian-mkconfig-ubuntu-distributor.patch"
	patch -Np1 -i "${srcdir}/debian-linuxefi.patch"
	patch -Np1 -i "${srcdir}/debian-mkconfig-signed-kernel.patch"
	patch -Np1 -i "${srcdir}/debian-install-signed.patch"
	patch -Np1 -i "${srcdir}/debian-sleep-shift.patch"
	patch -Np1 -i "${srcdir}/debian-wubi-no-windows.patch"
	patch -Np1 -i "${srcdir}/debian-maybe-quiet.patch"
	patch -Np1 -i "${srcdir}/debian-install-efi-adjust-distributor.patch"
	patch -Np1 -i "${srcdir}/debian-quick-boot.patch"
	patch -Np1 -i "${srcdir}/debian-quick-boot-lvm.patch"
	patch -Np1 -i "${srcdir}/debian-gfxpayload-dynamic.patch"
	patch -Np1 -i "${srcdir}/debian-vt-handoff.patch"
	patch -Np1 -i "${srcdir}/debian-probe-fusionio.patch"
	patch -Np1 -i "${srcdir}/debian-ignore-grub_func_test-failures.patch"
	patch -Np1 -i "${srcdir}/debian-mkconfig-recovery-title.patch"
	patch -Np1 -i "${srcdir}/debian-install-powerpc-machtypes.patch"
	patch -Np1 -i "${srcdir}/debian-ieee1275-clear-reset.patch"
	patch -Np1 -i "${srcdir}/debian-ppc64el-disable-vsx.patch"
	patch -Np1 -i "${srcdir}/debian-grub-install-pvxen-paths.patch"
	patch -Np1 -i "${srcdir}/debian-insmod-xzio-and-lzopio-on-xen.patch"
	patch -Np1 -i "${srcdir}/debian-grub-install-extra-removable.patch"
	patch -Np1 -i "${srcdir}/debian-mkconfig-other-inits.patch"
	patch -Np1 -i "${srcdir}/debian-zpool-full-device-name.patch"
	patch -Np1 -i "${srcdir}/debian-net-read-bracketed-ipv6-addr.patch"
	patch -Np1 -i "${srcdir}/debian-bootp-new-net_bootp6-command.patch"
	patch -Np1 -i "${srcdir}/debian-efinet-uefi-ipv6-pxe-support.patch"
	patch -Np1 -i "${srcdir}/debian-bootp-process-dhcpack-http-boot.patch"
	patch -Np1 -i "${srcdir}/debian-efinet-set-network-from-uefi-devpath.patch"
	patch -Np1 -i "${srcdir}/debian-efinet-set-dns-from-uefi-proto.patch"
	patch -Np1 -i "${srcdir}/debian-fix-lockdown.patch"
	patch -Np1 -i "${srcdir}/debian-skip-grub_cmd_set_date.patch"
	patch -Np1 -i "${srcdir}/debian-bash-completion-drop-have-checks.patch"
	patch -Np1 -i "${srcdir}/debian-at_keyboard-module-init.patch"
	patch -Np1 -i "${srcdir}/debian-uefi-secure-boot-cryptomount.patch"
	patch -Np1 -i "${srcdir}/debian-vsnprintf-upper-case-hex.patch"
	patch -Np1 -i "${srcdir}/debian-efi-variable-storage-minimise-writes.patch"
	patch -Np1 -i "${srcdir}/debian-no-devicetree-if-secure-boot.patch"
	patch -Np1 -i "${srcdir}/debian-grub-install-removable-shim.patch"
	patch -Np1 -i "${srcdir}/debian-sparc64-fix-bios-boot-partition-support.patch"
	patch -Np1 -i "${srcdir}/debian-verifiers-blocklist-fallout.patch"
	patch -Np1 -i "${srcdir}/debian-btrfs-raid1c34.patch"

	echo "Revert patch that handle the Debian kernel version numbers..."
	patch -Rp1 -i "${srcdir}/debian-dpkg-version-comparison.patch"

	echo "Fix output a menu entry for firmware setup on UEFI FastBoot..."
	patch -p1 -i "${srcdir}/0001-Fix-Output-a-menu-entry-for-firmware-setup-on-UEFI-F.patch"

	echo "Patch to detect of Arch Linux initramfs images by grub-mkconfig..."
	patch -Np1 -i "${srcdir}/0003-10_linux-detect-archlinux-initramfs.patch"

	echo "Patch to enable GRUB_COLOR_* variables in grub-mkconfig..."
	## Based on http://lists.gnu.org/archive/html/grub-devel/2012-02/msg00021.html
	patch -Np1 -i "${srcdir}/0004-add-GRUB_COLOR_variables.patch"

	echo "Patch to NLS installation..."
	patch -Np1 -i "${srcdir}/0005-grub-install-fix-inverted-test-for-NLS-enabled-when-.patch"

	echo "Fix DejaVuSans.ttf location so that grub-mkfont can create *.pf2 files for starfield theme..."
	sed 's|/usr/share/fonts/dejavu|/usr/share/fonts/dejavu /usr/share/fonts/TTF|g' -i "configure.ac"

	echo "Fix mkinitcpio 'rw' FS#36275..."
	sed 's| ro | rw |g' -i "util/grub.d/10_linux.in"

	echo "Fix OS naming FS#33393..."
	sed 's|GNU/Linux|Linux|' -i "util/grub.d/10_linux.in"

	echo "Pull in latest language files..."
	./linguas.sh

	echo "Avoid problem with unifont during compile of grub..."
	# http://savannah.gnu.org/bugs/?40330 and https://bugs.archlinux.org/task/37847
	gzip -cd "${srcdir}/unifont-${_UNIFONT_VER}.bdf.gz" > "unifont.bdf"

	echo "Run bootstrap..."
	./bootstrap \
		--gnulib-srcdir="${srcdir}/gnulib/" \
		--no-git

	echo "Make translations reproducible..."
	sed -i '1i /^PO-Revision-Date:/ d' po/*.sed
}

_build_grub-common_and_bios() {
	echo "Set ARCH dependent variables for bios build..."
	if [[ "${CARCH}" == 'x86_64' ]]; then
		_EFIEMU="--enable-efiemu"
	else
		_EFIEMU="--disable-efiemu"
	fi

	echo "Copy the source for building the bios part..."
	cp -r "${srcdir}/grub/" "${srcdir}/grub-bios/"
	cd "${srcdir}/grub-bios/"

	echo "Add the grub-extra sources for bios build..."
	install -d "${srcdir}/grub-bios/grub-extras"
	cp -r "${srcdir}/grub-extras/915resolution" \
		"${srcdir}/grub-bios/grub-extras/915resolution"
	export GRUB_CONTRIB="${srcdir}/grub-bios/grub-extras/"

	echo "Unset all compiler FLAGS for bios build..."
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS

	echo "Run ./configure for bios build..."
	./configure \
		--with-platform="pc" \
		--target="i386" \
		"${_EFIEMU}" \
		--enable-boot-time \
		"${_configure_options[@]}"

	if [ ! -z "${SOURCE_DATE_EPOCH}" ]; then
		echo "Make info pages reproducible..."
		touch -d "@${SOURCE_DATE_EPOCH}" $(find -name '*.texi')
	fi

	echo "Run make for bios build..."
	make
}

_build_grub-efi() {
	echo "Copy the source for building the ${_EFI_ARCH} efi part..."
	cp -r "${srcdir}/grub/" "${srcdir}/grub-efi-${_EFI_ARCH}/"
	cd "${srcdir}/grub-efi-${_EFI_ARCH}/"

	echo "Unset all compiler FLAGS for ${_EFI_ARCH} efi build..."
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS

	echo "Run ./configure for ${_EFI_ARCH} efi build..."
	./configure \
		--with-platform="efi" \
		--target="${_EFI_ARCH}" \
		--disable-efiemu \
		--enable-boot-time \
		"${_configure_options[@]}"

	echo "Run make for ${_EFI_ARCH} efi build..."
	make
}

_build_grub-emu() {
	echo "Copy the source for building the emu part..."
	cp -r "${srcdir}/grub/" "${srcdir}/grub-emu/"
	cd "${srcdir}/grub-emu/"

	echo "Unset all compiler FLAGS for emu build..."
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS

	echo "Run ./configure for emu build..."
	./configure \
		--with-platform="emu" \
		--target="${_EMU_ARCH}" \
		--enable-grub-emu-usb=no \
		--enable-grub-emu-sdl=no \
		--disable-grub-emu-pci \
		"${_configure_options[@]}"

	echo "Run make for emu build..."
	make
}

build() {
	cd "${srcdir}/grub/"

	echo "Build grub bios stuff..."
	_build_grub-common_and_bios

	echo "Build grub ${_EFI_ARCH} efi stuff..."
	_build_grub-efi

	if [[ "${CARCH}" == "x86_64" ]] && [[ "${_IA32_EFI_IN_ARCH_X64}" == "1" ]]; then
		echo "Build grub i386 efi stuff..."
		_EFI_ARCH="i386" _build_grub-efi
	fi

	if [[ "${_GRUB_EMU_BUILD}" == "1" ]]; then
		echo "Build grub emu stuff..."
		_build_grub-emu
	fi
}

_package_grub-common_and_bios() {
	cd "${srcdir}/grub-bios/"

	echo "Run make install for bios build..."
	make DESTDIR="${pkgdir}/" bashcompletiondir="/usr/share/bash-completion/completions" install

	echo "Remove gdb debugging related files for bios build..."
	rm -f "${pkgdir}/usr/lib/grub/i386-pc"/*.module || true
	rm -f "${pkgdir}/usr/lib/grub/i386-pc"/*.image || true
	rm -f "${pkgdir}/usr/lib/grub/i386-pc"/{kernel.exec,gdb_grub,gmodule.pl} || true

	echo "Install /etc/default/grub (used by grub-mkconfig)..."
	install -D -m0644 "${srcdir}/grub.default" "${pkgdir}/etc/default/grub"
}

_package_grub-efi() {
	cd "${srcdir}/grub-efi-${_EFI_ARCH}/"

	echo "Run make install for ${_EFI_ARCH} efi build..."
	make DESTDIR="${pkgdir}/" bashcompletiondir="/usr/share/bash-completion/completions" install

	echo "Remove gdb debugging related files for ${_EFI_ARCH} efi build..."
	rm -f "${pkgdir}/usr/lib/grub/${_EFI_ARCH}-efi"/*.module || true
	rm -f "${pkgdir}/usr/lib/grub/${_EFI_ARCH}-efi"/*.image || true
	rm -f "${pkgdir}/usr/lib/grub/${_EFI_ARCH}-efi"/{kernel.exec,gdb_grub,gmodule.pl} || true
}

_package_grub-emu() {
	cd "${srcdir}/grub-emu/"

	echo "Run make install for emu build..."
	make DESTDIR="${pkgdir}/" bashcompletiondir="/usr/share/bash-completion/completions" install

	echo "Remove gdb debugging related files for emu build..."
	rm -f "${pkgdir}/usr/lib/grub/${_EMU_ARCH}-emu"/*.module || true
	rm -f "${pkgdir}/usr/lib/grub/${_EMU_ARCH}-emu"/*.image || true
	rm -f "${pkgdir}/usr/lib/grub/${_EMU_ARCH}-emu"/{kernel.exec,gdb_grub,gmodule.pl} || true
}

package() {
	cd "${srcdir}/grub/"

	echo "Package grub ${_EFI_ARCH} efi stuff..."
	_package_grub-efi

	if [[ "${CARCH}" == "x86_64" ]] && [[ "${_IA32_EFI_IN_ARCH_X64}" == "1" ]]; then
		echo "Package grub i386 efi stuff..."
		_EFI_ARCH="i386" _package_grub-efi
	fi

	if [[ "${_GRUB_EMU_BUILD}" == "1" ]]; then
		echo "Package grub emu stuff..."
		_package_grub-emu
	fi

	echo "Package grub bios stuff..."
	_package_grub-common_and_bios

	echo "Package recordfail stuff..."
	install -D -m644 ${srcdir}/grub-recordfail.service "${pkgdir}/usr/lib/systemd/system/grub-recordfail.service"
}
