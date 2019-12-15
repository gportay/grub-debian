# Maintainer : Christian Hesse <mail@eworm.de>
# Maintainer : Ronald van Haren <ronald.archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Gaël PORTAY <gael.portay@collabora.com>

## "1" to enable IA32-EFI build in Arch x86_64, "0" to disable
_IA32_EFI_IN_ARCH_X64="1"

## "1" to enable EMU build, "0" to disable
_GRUB_EMU_BUILD="0"

_GRUB_EXTRAS_COMMIT="136763a4cc9ca3a4f59d05b79eede2159d6f441e"
_GNULIB_COMMIT="9ce9be2ef0cb1180e35dfe9dfbbe90d774b374bd"
_UNIFONT_VER="12.1.02"

[[ "${CARCH}" == "x86_64" ]] && _EFI_ARCH="x86_64"
[[ "${CARCH}" == "i686" ]] && _EFI_ARCH="i386"

[[ "${CARCH}" == "x86_64" ]] && _EMU_ARCH="x86_64"
[[ "${CARCH}" == "i686" ]] && _EMU_ARCH="i386"

pkgname='grub-debian'
pkgdesc='GNU GRand Unified Bootloader (2) with patches from Debian'
_pkgver=2.04
pkgver=${_pkgver/-/}
pkgrel=4
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
        'grub.default'
        'olpc-prefix-hack.patch'
        'core-in-fs.patch'
        'dpkg-version-comparison.patch'
        'grub-legacy-0-based-partitions.patch'
        'disable-floppies.patch'
        'grub.cfg-400.patch'
        'gfxpayload-keep-default.patch'
        'install-stage2-confusion.patch'
        'mkrescue-efi-modules.patch'
        'mkconfig-loopback.patch'
        'restore-mkdevicemap.patch'
        'gettext-quiet.patch'
        'mkconfig-mid-upgrade.patch'
        'install-efi-fallback.patch'
        'mkconfig-ubuntu-recovery.patch'
        'install-locale-langpack.patch'
        'mkconfig-nonexistent-loopback.patch'
        'no-insmod-on-sb.patch'
        'default-grub-d.patch'
        'blacklist-1440x900x32.patch'
        'uefi-firmware-setup.patch'
        'mkconfig-ubuntu-distributor.patch'
        'linuxefi.patch'
        'mkconfig-signed-kernel.patch'
        'install-signed.patch'
        'sleep-shift.patch'
        'wubi-no-windows.patch'
        'maybe-quiet.patch'
        'install-efi-adjust-distributor.patch'
        'quick-boot.patch'
        'quick-boot-lvm.patch'
        'gfxpayload-dynamic.patch'
        'vt-handoff.patch'
        'probe-fusionio.patch'
        'ignore-grub_func_test-failures.patch'
        'mkconfig-recovery-title.patch'
        'install-powerpc-machtypes.patch'
        'ieee1275-clear-reset.patch'
        'ppc64el-disable-vsx.patch'
        'grub-install-pvxen-paths.patch'
        'insmod-xzio-and-lzopio-on-xen.patch'
        'grub-install-extra-removable.patch'
        'mkconfig-other-inits.patch'
        'zpool-full-device-name.patch'
        'net-read-bracketed-ipv6-addr.patch'
        'bootp-new-net_bootp6-command.patch'
        'efinet-uefi-ipv6-pxe-support.patch'
        'bootp-process-dhcpack-http-boot.patch'
        'efinet-set-network-from-uefi-devpath.patch'
        'efinet-set-dns-from-uefi-proto.patch'
        'fix-lockdown.patch'
        'skip-grub_cmd_set_date.patch'
        'bash-completion-drop-have-checks.patch'
        'at_keyboard-module-init.patch'
        'uefi-secure-boot-cryptomount.patch'
        'vsnprintf-upper-case-hex.patch'
        'efi-variable-storage-minimise-writes.patch'
        'no-devicetree-if-secure-boot.patch'
        'grub-install-removable-shim.patch'
        'sparc64-fix-bios-boot-partition-support.patch')

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '04d652be1e28a6d464965c75c71ac84633085cd0960c2687466651c34c94bd89'
            'SKIP'
            '8dc5e5fe0dba842127cec88046cf505cdda08859d30acc18e4f72149d45bcdb2'
            '01b8d51914c4cd9914030b124e57097c1dc153d5cbad031a00470e891d5055db'
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
            '77a4cfcb66c60049e8dbf499936837a24bf78d6ee04fe51bf7e7e7fbc34c70f6'
            'bad9a5a36731fabbbc5fb3862fd657bee4fecb0b83b5ff6d8d79a15ee312c2ce'
            'b927c7779f8179156293eec36996ae22fdd21e30456f6c248acab61140056a48'
            'b066ede4e9ef35973a64690059197b913bb20ce6f90012fc5d5aec94242dc66c'
            'acf8200541132e176cb124b3c69b6d1a15f4ec9dce58f224a5859b929b7314cc'
            '8c960d42abfe091ce330fc909f4b085458996649db44e2cfc675013af639c342'
            'f54ca14e7a448e7bcff9a37e2f6bc081fd782b16bb4f87f62e1851b64101f3f4'
            '296a5defb59f3675df340cfdc30d0e375c71742bb670b43ddcc715ca0b970216'
            '49f369e7eec7682cf17982994c9d71257da7d07dcf7a59c54cab176b0761b4bd'
            'df725bdc2c489571ea6df9da9a8f9eaf63963d19db92e0dbad323cfe9520af17'
            '43ba0c9aeebf65bfcb3b4cae8e03df54ae1c3ce58c6d6435a1bd33b58bbdd32c'
            '07b3dd9a5cf49df270a3f9488dc50d5ccce68586f0888a7e9d59a1828e1021d2'
            'e8432692d36dc6df65aa6808103ba096347a5fe69ffb08760693001036fc6260'
            'cfbeb19f7846c73b2ed9f0133cb8fe9d8b67d1a0c49ca204e27b8d9cab85e246'
            '69cf6e044a80c4314963572196969254c9666332eac7fe8e9c8d107ed86c801a'
            '4a77db094754dd10151da0230cbd51f3b0cd2d7a6a9dcedb21e8702aa38dfab3'
            'b4ef871440fde14ba2535658f0bc26eba5b12fe9d211a7cc19a78c07beb53121'
            '26c4d98cc4041c3ea5b64d898435b20f54327d775c959cf972ceb3095193426c'
            '64ed3a60ce8aa28c1f92c09667a9dfb09260794584013053fbaec2ea9bda9897'
            '3e9c15bff1c4501f3df46fb84612ea9082eb7162597c9b2af04b68c38cd0d467'
            'cecf0286d24de6743a338385913ddd17c2d5ff9520d04fe6e899bcc12a31c60c'
            '7f0ef64ee2a601bc02ff07e1ce182d138ed7f7f7442d4c60ef54c4442759c1bb'
            '5007163a670a8e125222df07a1c067dbf461a2a86314d9c92b909b4b3d11860e'
            '34081b8ba676b0e2c8b89496869263dc51ed1942581db10702e3f8eb42702e8e'
            'ce89e7a6bf18bd26ad8becf35fadeb4d2f0bd83906ccb2bc9928025e20800693'
            'da8c5b824162b914c313fd386f5008e385607da40d9db9f8f9aff76b68fd5c8d'
            '3d74aecdb8a4f09a563eef3c0c98070fb2ea3d4e0f4b7ad75478e6698c94436b'
            'c8881ed95afc3c3e3ed4c69d9bbfb0100a47df10d067d91f0268d47aeb02821c'
            '08c0e0c44cb6218f5f71df8e3dfa8cf762e9c6199930f701f534014c46c5d018'
            '2af56cbb7168000aff5de4fe20ab6dd2cea4f9d4dafcd612ad2bcf5b90850f82'
            'f5b6d34bb43950d58772f474f6ed2f8e7c64f2b0911544642e9c8e24b76993bd'
            '67fb30ffc1035928012935a3986f26428dd8e5785113a71ce028ec1a2c509949'
            '132860bdedee57cd19ae6073448088429707522db4f370cc6da7076e31586f7d'
            '643ab85c0a5a79f28969d8e18a172b7c44a7f876032155fd93946b1b4b7db095'
            '212d78fb104a4131a9fc23f39eb09be4fd59fe97745fc697027debcb4bd5a4ee'
            'e79b73c5dac104a6c6efb14420fa17710afea10f7f728737aded97f5111735ec'
            'd00044ad5d6118235fbe7d3d56c4be13d22fa1db8644c65cbefcf744ad58f781'
            'ee4276491463ae10f0986c7a462709ea48770f6e0ab6866588b039729a1ec572'
            'fa8a0d89c1cd1ca49d4cb1fe078171c6aa29a315da01def39416ef781a8fdcb0'
            '693dde67c44e14c460659d8e8d6836d6c1fc5b20d9a9feb4037dcdf260e6754c'
            '6fff7d9323c21b0b0a495b7898f1013fd9507a8e3fe583951ca0e5e0a6cf3e50'
            '36f751960b1d4a6c7919051a54343cdb768bb282fa25b0fc2051ef1e7e5f3368'
            'f7066ba993345902bec2e2e384ba86a8295a65117bae19f69fa4314977e51eaa'
            '1ada2cf0f2c4e538f02ae95288e91560949fea4172beea2a1654f533637673af'
            '60b863fc2f0f31638776e99a4ae4e76266baeff028c9a57a02ee3694c00f4ee2'
            '5d4db6cbc02751e970239ad51386da91e02b9ecdf374abe7c780dc468d5df125'
            '52c7616be60005deeffd52026bd38621a60873d7dfd3992307ebda5402114624'
            '3882060cf638e67cbf654bf0878c64110637de7b5ba0db6ccc13345c1391c2a8')

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
	--enable-quick-boot
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
	patch -Np1 -i "${srcdir}/olpc-prefix-hack.patch"
	patch -Np1 -i "${srcdir}/core-in-fs.patch"
	patch -Np1 -i "${srcdir}/dpkg-version-comparison.patch"
	patch -Np1 -i "${srcdir}/grub-legacy-0-based-partitions.patch"
	patch -Np1 -i "${srcdir}/disable-floppies.patch"
	patch -Np1 -i "${srcdir}/grub.cfg-400.patch"
	patch -Np1 -i "${srcdir}/gfxpayload-keep-default.patch"
	patch -Np1 -i "${srcdir}/install-stage2-confusion.patch"
	patch -Np1 -i "${srcdir}/mkrescue-efi-modules.patch"
	patch -Np1 -i "${srcdir}/mkconfig-loopback.patch"
	patch -Np1 -i "${srcdir}/restore-mkdevicemap.patch"
	patch -Np1 -i "${srcdir}/gettext-quiet.patch"
	patch -Np1 -i "${srcdir}/mkconfig-mid-upgrade.patch"
	patch -Np1 -i "${srcdir}/install-efi-fallback.patch"
	patch -Np1 -i "${srcdir}/mkconfig-ubuntu-recovery.patch"
	patch -Np1 -i "${srcdir}/install-locale-langpack.patch"
	patch -Np1 -i "${srcdir}/mkconfig-nonexistent-loopback.patch"
	patch -Np1 -i "${srcdir}/no-insmod-on-sb.patch"
	patch -Np1 -i "${srcdir}/default-grub-d.patch"
	patch -Np1 -i "${srcdir}/blacklist-1440x900x32.patch"
	patch -Np1 -i "${srcdir}/uefi-firmware-setup.patch"
	patch -Np1 -i "${srcdir}/mkconfig-ubuntu-distributor.patch"
	patch -Np1 -i "${srcdir}/linuxefi.patch"
	patch -Np1 -i "${srcdir}/mkconfig-signed-kernel.patch"
	patch -Np1 -i "${srcdir}/install-signed.patch"
	patch -Np1 -i "${srcdir}/sleep-shift.patch"
	patch -Np1 -i "${srcdir}/wubi-no-windows.patch"
	patch -Np1 -i "${srcdir}/maybe-quiet.patch"
	patch -Np1 -i "${srcdir}/install-efi-adjust-distributor.patch"
	patch -Np1 -i "${srcdir}/quick-boot.patch"
	patch -Np1 -i "${srcdir}/quick-boot-lvm.patch"
	patch -Np1 -i "${srcdir}/gfxpayload-dynamic.patch"
	patch -Np1 -i "${srcdir}/vt-handoff.patch"
	patch -Np1 -i "${srcdir}/probe-fusionio.patch"
	patch -Np1 -i "${srcdir}/ignore-grub_func_test-failures.patch"
	patch -Np1 -i "${srcdir}/mkconfig-recovery-title.patch"
	patch -Np1 -i "${srcdir}/install-powerpc-machtypes.patch"
	patch -Np1 -i "${srcdir}/ieee1275-clear-reset.patch"
	patch -Np1 -i "${srcdir}/ppc64el-disable-vsx.patch"
	patch -Np1 -i "${srcdir}/grub-install-pvxen-paths.patch"
	patch -Np1 -i "${srcdir}/insmod-xzio-and-lzopio-on-xen.patch"
	patch -Np1 -i "${srcdir}/grub-install-extra-removable.patch"
	patch -Np1 -i "${srcdir}/mkconfig-other-inits.patch"
	patch -Np1 -i "${srcdir}/zpool-full-device-name.patch"
	patch -Np1 -i "${srcdir}/net-read-bracketed-ipv6-addr.patch"
	patch -Np1 -i "${srcdir}/bootp-new-net_bootp6-command.patch"
	patch -Np1 -i "${srcdir}/efinet-uefi-ipv6-pxe-support.patch"
	patch -Np1 -i "${srcdir}/bootp-process-dhcpack-http-boot.patch"
	patch -Np1 -i "${srcdir}/efinet-set-network-from-uefi-devpath.patch"
	patch -Np1 -i "${srcdir}/efinet-set-dns-from-uefi-proto.patch"
	patch -Np1 -i "${srcdir}/fix-lockdown.patch"
	patch -Np1 -i "${srcdir}/skip-grub_cmd_set_date.patch"
	patch -Np1 -i "${srcdir}/bash-completion-drop-have-checks.patch"
	patch -Np1 -i "${srcdir}/at_keyboard-module-init.patch"
	patch -Np1 -i "${srcdir}/uefi-secure-boot-cryptomount.patch"
	patch -Np1 -i "${srcdir}/vsnprintf-upper-case-hex.patch"
	patch -Np1 -i "${srcdir}/efi-variable-storage-minimise-writes.patch"
	patch -Np1 -i "${srcdir}/no-devicetree-if-secure-boot.patch"
	patch -Np1 -i "${srcdir}/grub-install-removable-shim.patch"
	patch -Np1 -i "${srcdir}/sparc64-fix-bios-boot-partition-support.patch"

	echo "Revert patch that handle the Debian kernel version numbers..."
	patch -Rp1 -i "${srcdir}/dpkg-version-comparison.patch"

	echo "Patch to detect of Arch Linux initramfs images by grub-mkconfig..."
	patch -Np1 -i "${srcdir}/0003-10_linux-detect-archlinux-initramfs.patch"

	echo "Patch to enable GRUB_COLOR_* variables in grub-mkconfig..."
	## Based on http://lists.gnu.org/archive/html/grub-devel/2012-02/msg00021.html
	patch -Np1 -i "${srcdir}/0004-add-GRUB_COLOR_variables.patch"

	echo "Fix DejaVuSans.ttf location so that grub-mkfont can create *.pf2 files for starfield theme..."
	sed 's|/usr/share/fonts/dejavu|/usr/share/fonts/dejavu /usr/share/fonts/TTF|g' -i "configure.ac"

	echo "Fix mkinitcpio 'rw' FS#36275..."
	sed 's| ro | rw |g' -i "util/grub.d/10_linux.in"

	echo "Fix OS naming FS#33393..."
	sed 's|GNU/Linux|Linux|' -i "util/grub.d/10_linux.in"

	echo "Pull in latest language files..."
	./linguas.sh

	echo "Remove not working langs which need LC_ALL=C.UTF-8..."
	sed -e 's#en@cyrillic en@greek##g' -i "po/LINGUAS"

	echo "Avoid problem with unifont during compile of grub..."
	# http://savannah.gnu.org/bugs/?40330 and https://bugs.archlinux.org/task/37847
	gzip -cd "${srcdir}/unifont-${_UNIFONT_VER}.bdf.gz" > "unifont.bdf"

	echo "Run bootstrap..."
	./bootstrap \
		--gnulib-srcdir="${srcdir}/gnulib/" \
		--no-git
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
}
