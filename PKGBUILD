# Maintainer : Christian Hesse <mail@eworm.de>
# Maintainer : Ronald van Haren <ronald.archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Gaël PORTAY <gael.portay@collabora.com>

## "1" to enable IA32-EFI build in Arch x86_64, "0" to disable
_IA32_EFI_IN_ARCH_X64="1"

## "1" to enable EMU build, "0" to disable
_GRUB_EMU_BUILD="0"

[[ "${CARCH}" == 'x86_64' ]] && _EFI_ARCH='x86_64'
[[ "${CARCH}" == 'i686' ]] && _EFI_ARCH='i386'

[[ "${CARCH}" == 'x86_64' ]] && _EMU_ARCH='x86_64'
[[ "${CARCH}" == 'i686' ]] && _EMU_ARCH='i386'

pkgname='grub-debian'
pkgdesc='GNU GRand Unified Bootloader (2) with patches from Debian'
epoch=2
_gnulib_commit='be584c56eb1311606e5ea1a36363b97bddb6eed3'
_unifont_ver='13.0.06'
_pkgver=2.04
pkgver=${_pkgver/-/}
pkgrel=20
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
        "git+https://git.savannah.gnu.org/git/gnulib.git#commit=${_gnulib_commit}"
        "https://ftp.gnu.org/gnu/unifont/unifont-${_unifont_ver}/unifont-${_unifont_ver}.bdf.gz"{,.sig}
        '0001-00_header-add-GRUB_COLOR_-variables.patch'
        '0002-10_linux-detect-archlinux-initramfs.patch'
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
        'debian-dejavu-font-path.patch'
        'debian-xen-ignore-xenpolicy-and-config.patch'
        'debian-xen-support-xsm.patch'
        'debian-xen-no-xsm-policy-in-non-xsm-options.patch'
        'debian-CVE-2020-10713.patch'
        'debian-safe-alloc-1.patch'
        'debian-safe-alloc-2.patch'
        'debian-safe-alloc-3.patch'
        'debian-safe-alloc-4.patch'
        'debian-iso9660-realloc-leak.patch'
        'debian-font-name-leak.patch'
        'debian-gfxmenu-load-image-double-free.patch'
        'debian-xnu-double-free.patch'
        'debian-lzma-overflow.patch'
        'debian-term-overflow.patch'
        'debian-udf-leak.patch'
        'debian-multiboot2-leak.patch'
        'debian-tftp-no-priority-queue.patch'
        'debian-relocator-chunk-addr-overflow.patch'
        'debian-relocator-chunk-align-underflow.patch'
        'debian-script-remove-unused-fields.patch'
        'debian-script-use-after-free.patch'
        'debian-relocator-chunk-align-fix-top.patch'
        'debian-hfsplus-overflow.patch'
        'debian-lvm-overflow.patch'
        'debian-emu-free-null.patch'
        'debian-efi-malformed-device-path.patch'
        'debian-efi-malformed-device-path-2.patch'
        'debian-safe-alloc-5.patch'
        'debian-efi-halt-reboot-use-after-free.patch'
        'debian-linux-loader-overflow.patch'
        'debian-linux-initrd-overflow.patch'
        'debian-bootp-alloc.patch'
        'debian-unix-config-overflow.patch'
        'debian-deviceiter-overflow.patch'
        'debian-osdep-exec-avoid-atexit-when-child-exits.patch'
        'debian-grub-install-backup-and-restore.patch'
        'debian-tftp-roll-over-block-counter.patch'
        'debian-mdraid1x-linux-gcc-10.patch'
        'debian-zfs-gcc-10.patch'
        'debian-uefi-firmware-efivarfs.patch'
        'debian-grub-install-inverted-nls-test.patch'
        'debian-2021-02-security-001-verifiers-Move-verifiers-API-to-kernel-image.patch'
        'debian-2021-02-security-002-kern-Add-lockdown-support.patch'
        'debian-2021-02-security-003-kern-lockdown-Set-a-variable-if-the-GRUB-is-locked-down.patch'
        'debian-2021-02-security-004-efi-Lockdown-the-GRUB-when-the-UEFI-Secure-Boot-is-enabled.patch'
        'debian-2021-02-security-005-efi-Use-grub_is_lockdown-instead-of-hardcoding-a-disabled-modules-list.patch'
        'debian-2021-02-security-006-acpi-Don-t-register-the-acpi-command-when-locked-down.patch'
        'debian-2021-02-security-007-mmap-Don-t-register-cutmem-and-badram-commands-when-lockdown-is-enforced.patch'
        'debian-2021-02-security-008-commands-Restrict-commands-that-can-load-BIOS-or-DT-blobs-when-locked-down.patch'
        'debian-2021-02-security-009-commands-setpci-Restrict-setpci-command-when-locked-down.patch'
        'debian-2021-02-security-010-commands-hdparm-Restrict-hdparm-command-when-locked-down.patch'
        'debian-2021-02-security-011-gdb-Restrict-GDB-access-when-locked-down.patch'
        'debian-2021-02-security-012-loader-xnu-Don-t-allow-loading-extension-and-packages-when-locked-down.patch'
        'debian-2021-02-security-013-docs-Document-the-cutmem-command.patch'
        'debian-2021-02-security-014-dl-Only-allow-unloading-modules-that-are-not-dependencies.patch'
        'debian-2021-02-security-015-usb-Avoid-possible-out-of-bound-accesses-caused-by-malicious-devices.patch'
        'debian-2021-02-security-016-mmap-Fix-memory-leak-when-iterating-over-mapped-memory.patch'
        'debian-2021-02-security-017-net-net-Fix-possible-dereference-to-of-a-NULL-pointer.patch'
        'debian-2021-02-security-018-net-tftp-Fix-dangling-memory-pointer.patch'
        'debian-2021-02-security-019-kern-parser-Fix-resource-leak-if-argc-0.patch'
        'debian-2021-02-security-020-kern-efi-Fix-memory-leak-on-failure.patch'
        'debian-2021-02-security-021-kern-efi-mm-Fix-possible-NULL-pointer-dereference.patch'
        'debian-2021-02-security-022-gnulib-regexec-Resolve-unused-variable.patch'
        'debian-2021-02-security-023-gnulib-regcomp-Fix-uninitialized-token-structure.patch'
        'debian-2021-02-security-024-gnulib-argp-help-Fix-dereference-of-a-possibly-NULL-state.patch'
        'debian-2021-02-security-025-gnulib-regexec-Fix-possible-null-dereference.patch'
        'debian-2021-02-security-026-gnulib-regcomp-Fix-uninitialized-re_token.patch'
        'debian-2021-02-security-027-io-lzopio-Resolve-unnecessary-self-assignment-errors.patch'
        'debian-2021-02-security-028-zstd-Initialize-seq_t-structure-fully.patch'
        'debian-2021-02-security-029-kern-partition-Check-for-NULL-before-dereferencing-input-string.patch'
        'debian-2021-02-security-030-disk-ldm-Make-sure-comp-data-is-freed-before-exiting-from-make_vg.patch'
        'debian-2021-02-security-031-disk-ldm-If-failed-then-free-vg-variable-too.patch'
        'debian-2021-02-security-032-disk-ldm-Fix-memory-leak-on-uninserted-lv-references.patch'
        'debian-2021-02-security-033-disk-cryptodisk-Fix-potential-integer-overflow.patch'
        'debian-2021-02-security-034-hfsplus-Check-that-the-volume-name-length-is-valid.patch'
        'debian-2021-02-security-035-zfs-Fix-possible-negative-shift-operation.patch'
        'debian-2021-02-security-036-zfs-Fix-resource-leaks-while-constructing-path.patch'
        'debian-2021-02-security-037-zfs-Fix-possible-integer-overflows.patch'
        'debian-2021-02-security-038-zfsinfo-Correct-a-check-for-error-allocating-memory.patch'
        'debian-2021-02-security-039-affs-Fix-memory-leaks.patch'
        'debian-2021-02-security-040-libgcrypt-mpi-Fix-possible-unintended-sign-extension.patch'
        'debian-2021-02-security-041-libgcrypt-mpi-Fix-possible-NULL-dereference.patch'
        'debian-2021-02-security-042-syslinux-Fix-memory-leak-while-parsing.patch'
        'debian-2021-02-security-043-normal-completion-Fix-leaking-of-memory-when-processing-a-completion.patch'
        'debian-2021-02-security-044-commands-hashsum-Fix-a-memory-leak.patch'
        'debian-2021-02-security-045-video-efi_gop-Remove-unnecessary-return-value-of-grub_video_gop_fill_mode_info.patch'
        'debian-2021-02-security-046-video-fb-fbfill-Fix-potential-integer-overflow.patch'
        'debian-2021-02-security-047-video-fb-video_fb-Fix-multiple-integer-overflows.patch'
        'debian-2021-02-security-048-video-fb-video_fb-Fix-possible-integer-overflow.patch'
        'debian-2021-02-security-049-video-readers-jpeg-Test-for-an-invalid-next-marker-reference-from-a-jpeg-file.patch'
        'debian-2021-02-security-050-gfxmenu-gui_list-Remove-code-that-coverity-is-flagging-as-dead.patch'
        'debian-2021-02-security-051-loader-bsd-Check-for-NULL-arg-up-front.patch'
        'debian-2021-02-security-052-loader-xnu-Fix-memory-leak.patch'
        'debian-2021-02-security-053-loader-xnu-Free-driverkey-data-when-an-error-is-detected-in-grub_xnu_writetree_toheap.patch'
        'debian-2021-02-security-054-loader-xnu-Check-if-pointer-is-NULL-before-using-it.patch'
        'debian-2021-02-security-055-util-grub-install-Fix-NULL-pointer-dereferences.patch'
        'debian-2021-02-security-056-util-grub-editenv-Fix-incorrect-casting-of-a-signed-value.patch'
        'debian-2021-02-security-057-util-glue-efi-Fix-incorrect-use-of-a-possibly-negative-value.patch'
        'debian-2021-02-security-058-script-execute-Fix-NULL-dereference-in-grub_script_execute_cmdline.patch'
        'debian-2021-02-security-059-commands-ls-Require-device_name-is-not-NULL-before-printing.patch'
        'debian-2021-02-security-060-script-execute-Avoid-crash-when-using-outside-a-function-scope.patch'
        'debian-2021-02-security-061-lib-arg-Block-repeated-short-options-that-require-an-argument.patch'
        'debian-2021-02-security-062-script-execute-Don-t-crash-on-a-for-loop-with-no-items.patch'
        'debian-2021-02-security-063-commands-menuentry-Fix-quoting-in-setparams_prefix.patch'
        'debian-2021-02-security-064-kern-misc-Always-set-end-in-grub_strtoull.patch'
        'debian-2021-02-security-065-video-readers-jpeg-Catch-files-with-unsupported-quantization-or-Huffman-tables.patch'
        'debian-2021-02-security-066-video-readers-jpeg-Catch-OOB-reads-writes-in-grub_jpeg_decode_du.patch'
        'debian-2021-02-security-067-video-readers-jpeg-Don-t-decode-data-before-start-of-stream.patch'
        'debian-2021-02-security-068-term-gfxterm-Don-t-set-up-a-font-with-glyphs-that-are-too-big.patch'
        'debian-2021-02-security-069-fs-fshelp-Catch-impermissibly-large-block-sizes-in-read-helper.patch'
        'debian-2021-02-security-070-fs-hfsplus-Don-t-fetch-a-key-beyond-the-end-of-the-node.patch'
        'debian-2021-02-security-071-fs-hfsplus-Don-t-use-uninitialized-data-on-corrupt-filesystems.patch'
        'debian-2021-02-security-072-fs-hfs-Disable-under-lockdown.patch'
        'debian-2021-02-security-073-fs-sfs-Fix-over-read-of-root-object-name.patch'
        'debian-2021-02-security-074-fs-jfs-Do-not-move-to-leaf-level-if-name-length-is-negative.patch'
        'debian-2021-02-security-075-fs-jfs-Limit-the-extents-that-getblk-can-consider.patch'
        'debian-2021-02-security-076-fs-jfs-Catch-infinite-recursion.patch'
        'debian-2021-02-security-077-fs-nilfs2-Reject-too-large-keys.patch'
        'debian-2021-02-security-078-fs-nilfs2-Don-t-search-children-if-provided-number-is-too-large.patch'
        'debian-2021-02-security-079-fs-nilfs2-Properly-bail-on-errors-in-grub_nilfs2_btree_node_lookup.patch'
        'debian-2021-02-security-080-io-gzio-Bail-if-gzio-tl-td-is-NULL.patch'
        'debian-2021-02-security-081-io-gzio-Add-init_dynamic_block-clean-up-if-unpacking-codes-fails.patch'
        'debian-2021-02-security-082-io-gzio-Catch-missing-values-in-huft_build-and-bail.patch'
        'debian-2021-02-security-083-io-gzio-Zero-gzio-tl-td-in-init_dynamic_block-if-huft_build-fails.patch'
        'debian-2021-02-security-084-disk-lvm-Don-t-go-beyond-the-end-of-the-data-we-read-from-disk.patch'
        'debian-2021-02-security-085-disk-lvm-Don-t-blast-past-the-end-of-the-circular-metadata-buffer.patch'
        'debian-2021-02-security-086-disk-lvm-Bail-on-missing-PV-list.patch'
        'debian-2021-02-security-087-disk-lvm-Do-not-crash-if-an-expected-string-is-not-found.patch'
        'debian-2021-02-security-088-disk-lvm-Do-not-overread-metadata.patch'
        'debian-2021-02-security-089-disk-lvm-Sanitize-rlocn-offset-to-prevent-wild-read.patch'
        'debian-2021-02-security-090-disk-lvm-Do-not-allow-a-LV-to-be-it-s-own-segment-s-node-s-LV.patch'
        'debian-2021-02-security-091-fs-btrfs-Validate-the-number-of-stripes-parities-in-RAID5-6.patch'
        'debian-2021-02-security-092-fs-btrfs-Squash-some-uninitialized-reads.patch'
        'debian-2021-02-security-093-kern-parser-Fix-a-memory-leak.patch'
        'debian-2021-02-security-094-kern-parser-Introduce-process_char-helper.patch'
        'debian-2021-02-security-095-kern-parser-Introduce-terminate_arg-helper.patch'
        'debian-2021-02-security-096-kern-parser-Refactor-grub_parser_split_cmdline-cleanup.patch'
        'debian-2021-02-security-097-kern-buffer-Add-variable-sized-heap-buffer.patch'
        'debian-2021-02-security-098-kern-parser-Fix-a-stack-buffer-overflow.patch'
        'debian-2021-02-security-099-kern-efi-Add-initial-stack-protector-implementation.patch'
        'debian-2021-02-security-100-util-mkimage-Remove-unused-code-to-add-BSS-section.patch'
        'debian-2021-02-security-101-util-mkimage-Use-grub_host_to_target32-instead-of-grub_cpu_to_le32.patch'
        'debian-2021-02-security-102-util-mkimage-Always-use-grub_host_to_target32-to-initialize-PE-stack-and-heap-stuff.patch'
        'debian-2021-02-security-103-util-mkimage-Unify-more-of-the-PE32-and-PE32-header-set-up.patch'
        'debian-2021-02-security-104-util-mkimage-Reorder-PE-optional-header-fields-set-up.patch'
        'debian-2021-02-security-105-util-mkimage-Improve-data_size-value-calculation.patch'
        'debian-2021-02-security-106-util-mkimage-Refactor-section-setup-to-use-a-helper.patch'
        'debian-2021-02-security-107-util-mkimage-Add-an-option-to-import-SBAT-metadata-into-a-.sbat-section.patch'
        'debian-2021-02-security-108-grub-install-common-Add-sbat-option.patch'
        'debian-2021-02-security-109-kern-misc-Split-parse_printf_args-into-format-parsing-and-va_list-handling.patch'
        'debian-2021-02-security-110-kern-misc-Add-STRING-type-for-internal-printf-format-handling.patch'
        'debian-2021-02-security-111-kern-misc-Add-function-to-check-printf-format-against-expected-format.patch'
        'debian-2021-02-security-112-gfxmenu-gui-Check-printf-format-in-the-gui_progress_bar-and-gui_label.patch'
        'debian-2021-02-security-113-kern-mm-Fix-grub_debug_calloc-compilation-error.patch'
        'debian-pc-verifiers-module.patch'
        'debian-enable_shim_lock_i386_efi.patch'
        'debian-debug_verifiers.patch'
        'debian-mkimage-fix-section-sizes.patch'
        'debian-tpm-unknown-error-non-fatal.patch')

sha256sums=('SKIP'
            'SKIP'
            'b7668a5d498972dc4981250c49f83601babce797be19b4fdd0f2f1c6cfbd0fc5'
            'SKIP'
            'd310396bc65b82a36a66b54abb41b52be345a57dd41d3d4e3024d87a79030d4f'
            '6bd8cb45a790d8691baf37a7742631f1d44c94a4c0c87820e27840b69b201722'
            '65d41c0bcb933cf06060082b60571ba6c4e40b873e13117fca5708101e7182c2'
            '791fadf182edf8d5bee4b45c008b08adce9689a9624971136527891a8f67d206'
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
            '44a1ec4c5cadf5899b5e99c8cb385179d36840d6c8a036b06097ea127ae7ef15'
            '6dc9155bbf20187b84611a922631e038e42194a1878dbac27ccf49e5fa81c4dc'
            '6f4b877e13457bb43e8649a9cb6a577ea8ed5ebaadb67dfd40c763964aa29f49'
            'f1572755df503b3566a01ce6e8d8b4ff1a6cea29fdc7330c7ab15928daa0a869'
            '0d90b9182737869b2aaa7666c4f09932df7f6d41cc429ca3abff662b36c84cab'
            'c03a44dc077f29bca88318e3ab5654b11e4dffe0ef9a60cc25215904d320e6bc'
            'a43cf448d7986de5db28ff99f6a075b24102413c6c8b61bcc0336b76bc026768'
            'cba7040e106f7038b564e2a8425a962ee0c5b759adb7342dd6ed157263702e4c'
            'b48da6c257d36d490c2f14eae793a503f95a7466706053540a2d59fa97e7f94f'
            '7df27d5b066d91e12e4db483e8535d2511f015a4ebd15d482ae480788b46b908'
            '9ca5c2b8e390fdd2c1a24e4f692141e166c5929ca287b80784cdc27e6266d6d7'
            '06b10052f09aacba2f4e697f15def925ce0fa3b30d7e2f028a9814d711b3f90b'
            'a3e4895df064de1c527612013653998a675f8b2a30d7e835bb0ad92ef158da5a'
            '1b223772a527b1df89d8a36dcff8df17d1f9706089f25522f57a89af543bd8f7'
            '4a01fc293f345f008ccf3b80d905849252de1418a14bb3873582bec04ace8694'
            '5151dccb4a44d26dd21eed6568046f5b292d78bff54c7645c641e67e496b1a8a'
            '70ed65a37e9e234a94a5b7b5cbb077a0969658d7c75089f99bf42510b3a546ae'
            '55826d5c7843fd606c65c070725b0d7017df3a6eec570bbec8fcd933244e6c22'
            'c8506be7a8296a3f04b93a172015156c1dbc8c57786389e57c924ed43a5f3dc3'
            '191225d18422a9b884d53607554ba6fa8b8a21d3384f1bf4ccf0c0ef17ad7c95'
            '574d1bab06990463b121274052a5eed7069af69bbbd272ba175cebf4749d43d2'
            '727cc99707373b06e3063ee580e41df8acb40437bc8ec318795399ed48be8da1'
            '54c095cc81713e5b55d9f0cc819c43066651528217b0652a75f60874337c1222'
            '18e09d905b0d87ea23b3e3c0b8a2ededfa627d20409e0ee145f962b77ca3406d'
            'a0aa7d3858b272f6341a57938945012725f4223079430e1cd915753e4368f186'
            '51fac799cf64764aa6248284a5c15ceec146417d10f9922bfeb488a0b5869eed'
            '2d4668620e46ba28c3bdb0ba0b2104a0b739a5886a3892a4bff3e77d0c77b051'
            'f56fed27ceb758796d16313ed08944c0e529797eddccff94b73ee8121910f0dc'
            '4d1ce68c2ccad6b7829fc2bf081c59b04ec9b6327a7a4a13b9074e438727ce88'
            '68ef3222ec2d09a1c33b1a7692503faaf21862e0c856c86e63eb3d12753f94cf'
            '1779e1bd323c3c2c81f2513dff494ebde9a0e7f1dedeec510e6ab888cbb5a75d'
            'dd0658b2414cf0498c8b207383064ea725fa4225f4f3e2f7f2d10072b2877967'
            'cbc785aab8d6211f2e12db87e28e6ee10302bde82236320991a1a85b099b9315'
            '7eab2dcde6a5b0e309e28480d90dd7475db8bdf8d0cfc0c07213899436d8d720'
            '77bc269851a5ef01db256a745b93bb191936a2c9018884f88a9a7b0d657741b9'
            'c37cb775a5a44b07b1b061b5d74a0f7f9cabe80758d9901580605a6c6372a93c'
            '62f4ac120cb13bd5b083869510e40981c5d5125d51426600e813c573c89f086d'
            '37107746081d6cf483f0679be7d9efdc98282fd302f14f47723c875b4ca065dd'
            '1acb5b917daf8ad6b036253d7f9b35c242eca804d10381ca91e8732f2b2b6f0d'
            'f436c83f922e3f1c61358c52ad1f85b57f497ad2e0a3954eb3bd798be1c4ba79'
            'cfb01c80b2d1f3f3e27527c725d5d85e3887b44e843cf3864bef5039bc21dd69'
            'e37db6ae028c38982bb4e99c7b7f1cfdc19f0f40c75a32d0472ba7b11e40b5ea'
            'db1051ec6f06da77a4002d0c3e14151655ce2064a0ffa068ada59bc5a4697139'
            'ebad641797c28fdd83381981f24a29b52154f6c0066d5c81529b9c4f35e5c2b7'
            'd3d3005ac18393b70b355270fbb49cb2667dbb27f8f0e1b5b9a6d170f4709fc1'
            '285b23238616a2376940175c32c1e83c1c0744ae74e7a6ac5a61c46b5fe12efa'
            '247d0e82a4e6829d252ffe359927c61012aed8628d2095b96caa06a5665d6a1e'
            '6489d703e6b23ffc17d670cff90e6894876123ed9577826599d9e7a69fb77b07'
            '6eea4c63941a37ec08c39c671f8e9ee905138fbe601a61d3c68d3d69703e1bb7'
            '2132fcbb3a2c68202104d349a8141ba7ea2b18420d3dba9c3f314afc083c9b32'
            'cc096656f00aa15b1ff5110111b3a0860e3f933f5615f57a8ad5d1d6e274ef6d'
            '97aaafa8ef9b78196d919521b87df940c87a83cd1a213a9faddc4fdf0095ef77'
            '9e5731883147da21041ac71e51f6a927635a65b0865a81f84b6e22cbc9cfffe0'
            'ecb5c45bc9386be5a39bfc3d363934da3d57a3ddaf5a6b7accd7bf10260d543a'
            'a653da52b9300e3e16868c8f9351bd762eca01eca9eb7e2d242969ee12fdb5ec'
            '1256997598244bb5594a47f88abdbb15612eab48e306cc4850cd714968c9b77f'
            '81f1359911c40580843d40fd51afac3e1cd78c0cdd1515493e211504ad418269'
            'ee9dbf141ea1bfc4af03cf900effdf48f0aeb439b8b0ec42c56fc16d4afff5bb'
            'c9a839e726f89abaa0276257ee38fdc7cc9d24fae02d7a928d252b09d3cc0f72'
            '4229dbd0be93b9be70019d67e332c23061049e7df6434b5d140fba7bbe662e44'
            'b07cf0ac1642915591e00249595496908cb387a6dfebe2571036b0da03f990cf'
            'e8f68de0193df5416dfe4d6d3f98dd1c4028067c17df6235f34d1a364862db07'
            'a55338647a856fbdf0185cffce11cc7afceb572b4c3e4e8228ca0d600012dadc'
            '787f9702270c5b961b36bd72d607c4b8c5dc0a5aa6bb5ebe779f3a453af41081'
            '27956645c1c6b332beb0097954652eaaeace5c496367c353832439639144c6f4'
            '26db1c11c60bd3bf7f7d8fc97ec2d053f933783c9f9caae885e4dca36fda116c'
            'bb148c8d2ec5a8682f642c933765d46b80e882f279bdf7ea13ded8c00add1ed8'
            'a42ffdadfe8dc35e7a2abe405956601fed756be12454b2f1bbdb21d47f913288'
            '40856ff4f5a4fbf02c37e1297de0c32033dc4d6ff30c4472d2b6d78f81dbd1f5'
            '1e07f892e577c5fe6fa9750fc01b16eeb7969470d60fe92befb1824be2d7915b'
            '33feb8a4abbe71f258de94dc1486161fe204f8b56fa07ed30260754e243359b0'
            '3fc54ec7c1120e8ccd7ee10273f5c4168a9bf0d343e2313dec884a42ea2a7254'
            '053feecbe15d5eb054b04a300e2f8f7163a727d99def81e2be81375b508edd57'
            '305173207dc98fdba15b4916f2379caa03db2c0c91533cefc139c93b6fab5390'
            'd5ef479dc23786b4bdb1262787701c0450b5856e4f0344319f6ef077c25d7a38'
            'fa886c8bc1fe9f6a109cdcd5cfb2e51ee954b0050a2d1807414f7e705c7d9b67'
            '4b508b50bc57ebe7a10084ba1191665d722dc1925586fbff82395d2c17f560f5'
            '72e187259382af55c35914bd9830df308921888cde9779077040d79da0ce8c2d'
            '45bf92f0fe660cb42ca58d0e15fe8204423d05a14854e87445dd75f0ef5782ef'
            '6ac5aed3ab74fedec04e9393f50e348d69a42cd7df2bfc534e7dd037176e9780'
            '4eb48ea7f82358ae376a621b8c31d031f0145ec06e60cc8cab37118212f9375f'
            'b79bf6216191c34742bfa8b9e0f4dfbde3074b0fbf1c1aaa2e80ab3b112aeb87'
            'c9ef75fb48fdc74f71d65e695b0d62b51c358b3e3a26afa9a77cf446b1060e85'
            'eb3dad3635b649390680cc8dbf90c95341534fdfe6a72a75d1eef2081625a07c'
            'b0bdf1208c8b607af22edf7ae234cf5f080809daa3bb3cd3a693a5afdc5248ed'
            '40f683e5a3c0b2566403cd5f20b37270702532a77a7540a02e2e8d1e1e6e3a93'
            'bf4e3a1ac3b107675b3f122a92f18cf5c7404e831542982ef10736d3ddda19f0'
            '7677813b275daa2ceb367f0bf33e1504f9af437b413e9849c311d39449837cfb'
            'b246b3d09c2366ff8aa781cea444d176abd9f328c62ad2a3438213c3f43e6d10'
            'ac8eaca294a2fc1876a109190eb1abe9270e2bb76f6a67732b2f84ed3e3ab14e'
            '2101846e85c5d2da6488b4af426c8b224fbbac926edc29cf0a5e5a3c49b79b8a'
            'ef972580855a25df65132e100f3d3757349ad8274b1b89ffc40eb2b35425a5b3'
            'fb73d73d7f29c66e33a5c64f666ff6b9b06b29b22cbe05483e0fc5c86dfa5777'
            'ded467d04de6964238e38d4c3fab33165ac132f762ca6f35b13d64d1174c38ce'
            'e766769c9d40c379f6dec98f92c5949c282d2ef9f465e1dab3f2140842cc60b5'
            '765b7cd7874d96408e8e21164338c3f0c2a788ac67fe337d5c9a440e71769321'
            'a4b29819207ea515fe144598c8142e2f322b1785138c47e5822867920a223b61'
            '99a8426b8dddf88f28646d8b2f4c0ddf0c1aed9c2c9d448dfe16842c207b7e1d'
            '1b449f7c241b4d128f0fca0f37f770b87e63eed17b25f062fde311ae6373b3bc'
            '17667b5f504db05809647dd744c128ef4d4f85ee334722f8c4f78bad4343aee9'
            '47f4076d4f9885ccd2ec4eed15a51fc8741be1eb61416f9a94ffbe3cb810d225'
            'b8da1bb2cea1b1e0c6ca94d7dfb3e5dcceee765d7abbcafba3f1f7e37d13b764'
            'e89ce4bc8a857349ec0f6423a75dea83a7962c5d4261594ab6ba5f45ad0c4c90'
            'c23e92f0d88c9bf0748ff25cb7bf61e39db259408cabe5e77c268ec59dc20aee'
            '97005f7cc5c4b6f1c209e8aaf7b76d7dd8a1a11c501644c8181d3e00f1d26b0a'
            '0ac66c1c1c0da987ccd5cc730d2e4b58b948adc1c3a7e7843a2eebe95d9fd7e3'
            '97be69bc7b9ad03cdac3aec254a8012666184eb6c895d30c69e421e9bea7ea9f'
            'c1a9a4d911ea5f051c86370cb9da0158b467675848f89459861c0cba34ca1ec0'
            '73869a3ccb9596669fb52909a60e08c69e19bd87f8b85245d3a05f84bf779238'
            'f5a34a69711c2c9409fea472b59f881c5049d86143126b64bd65d67ad34718c7'
            'e7f34418acab5ec02386fe0cabf162b33422cec24714750bf5f2651dcc733064'
            '8e58088df4fd54ecc77bbde86437b6287ee32321984690e589c2c81cf19431c3'
            '2a939037b7954ea779528fa06d5cb644a5b458f81d6e07a55b9f2249c332004a'
            '16c9c04b66cdec6c14889a38a8c8215da7796ad138f9a3040f70ce57e625f717'
            'f49325bec399ce2a232f03c49e3ef6b8bc19f2369d808d8a2cec9f41a3a788f7'
            '45e728880e17ac49732fcd7c8fc617301f844fb3ce004ad8af1c96f98f2c497f'
            'efba84b2e2e418f4f6b4fd726459ee5b33b6fc517820f1c56ff61193a5568a52'
            '2bc4c20d5a354045cbdc76c1a16bdd2b7565d77cd0f7120665cb464f16fe3225'
            '494af7fcebf4553cf86c8dcd844f51e507eb95f5f6e67fbccbf69bdd18e0d9f1'
            '309a51c51994b16d35ce770049ccdfd0f29c85eefada11545265e6dd4580bbd7'
            'c1a759d55bdf9f32d6814f095983b73279de6dfcc568201c68fa5fdf9c44bf6a'
            'd71be2779c0d218c19b33c2e04c02071b97a2f6486df50831c79e02ac7adeff2'
            '3ca980ad65c71d081afa95273b376185fd43cee49b1e0a2d29c9515ceb5b22b3'
            '99134d18c3dd925e4b071af2987140fae62d2795ba3047dcb9f75d6eff53e92f'
            'fe4495c6588476429035c9309f39e51bf32b773c2b3ea5e437bed88b7802861b'
            '834dffc18a1648edd1758808fa52ec03b0de68297f1931dff21e76fbe7e2938e'
            '04065e62999311059f9bd8a4b050546cab31e4bb1bf38a2feb1e9d9fc1edc664'
            '22a4a07f473b52a3b079e4cfd0334840f267fbeeea450b7f8e2161bc86270c1f'
            '1987538349aaf9c9a33893eab46a17753617f3411b5eba34ccb072468f0c2956'
            'cb477863c2621be8273c0356c36e396a4b255bacf4aa59843e1950b396dd4c60'
            '4367a4c0f6c0136dcb0d212ebb3dd900ab29bdf95f32b92121cf0afd9ec2934c'
            'f9cb6a4159cb6d92a30a74bb5bb34bf3b15674c6284370affcc1d504eaf22e2d'
            'ecae5e82e601905cd144fb9f542b68ce6c11f7b3b492e788bb6528d51212a1ce'
            'a14f1be6b726545180bdb474a9a1e27d9f9795492652f89f7e7c06284f0915db'
            'fb3f3cab015072c71fc0b0ea168c5f088807063343850a1d1f1ae5459100d321'
            '196cfc44bac33d4203cc74bd3ecf7e67273303745575cb4480cce999f110554e'
            'af98e889736fa56f2aded2a5e43c15442f7ae55cce3be4d401d58b6ea983ecde'
            'd7e7ef4433e841f0a4ea6d57a8c391b5d4b975818f834b56080b642a32c670ee'
            '251e39abafa41ce2075260ef25d7e06b45bc4bf46d56b755605da26c832c1712'
            'a7f1021d4c52ede4bfc581163ce99d0258d13c74f9c1a37e0a1e8f1d9af4a91f'
            '84fa209bdef4b8408a942899672245b02fed64ffee280e2813809455dedf6ba9'
            '028f0016882b99813bd6f6973b8f627820a7b164e4532c5e2a0949a0c1d98731'
            'a99acf5a25aad11de1cde46ee98e978f276791575a012d005e6fd4592f6fa12c'
            '0e492cbdca9c22730c01dcadd49a87eb631a58f00d31a5a6291e4ca6900dc4c6'
            '58b4d42fa7d54d32cbb5fc0bd026bb65b1eb669c7aaa7c62d44b2ee1bd4defe0'
            'db8ab7f59f89f1eed6e98a3d949e2521c9c4872b03f240bb432b8c9ed12dfe46'
            '568d2c258cfe3607f28f1d9c4e4c8c6b44aa3d3abc3f273ae34449eed64bd75f'
            'c9044f51a22464dc81d7dc488aaf40f66619e9bb3fd35b411de039cf64edd34f'
            'f2d4feec71c06ed0105ed826b1197805bdad6ec621df83d985df69a89ffdce16'
            '52788698af92b663e4ef6264326af665442d5f7ae417cf40a779fd960d43a603'
            '6a33f5ace7461330560877cb2a06a64d7890cda2167adb9c351072f7fe3406a3'
            'e195727c506e341a847754984c58f7e299b08154d148523b59dd6109330f84bc'
            'ec113a36bebcd1972d0216d17ac72b1fe81a4bdcea84e3f5c8f25b02c5d8124e'
            'e20b45123df8555087cb183a6d4c70985606420c51d1484594ff94c681a1365e'
            '3dde13488a07fcab34fd0d31435e34d1a01f8d8068cd9c6bb61de2977426f967'
            '6cd2a1a0015421f1af64a084d25b0172695be7226e0b6aa6eb2f3d5717ee18a4'
            '0b0501e6b139a0f918cad22aaf8e17764c285c5fde72620df430ccb1db2cb361'
            'c289b9e08277d968b1e06d57d53e05fb75c81565820ae21202c300416095f77c'
            '0244e91733a2eb44641d30c3f85d677fa830b9146997d630dd35f820113bd40b'
            '294acac780e258492c5b0ab215024ba0edcd2702c3cc96708e0fe105213f2b68')

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

	echo "Run bootstrap..."
	./bootstrap \
		--gnulib-srcdir="${srcdir}/gnulib/" \
		--no-git

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
	patch -Np1 -i "${srcdir}/debian-dejavu-font-path.patch"
	patch -Np1 -i "${srcdir}/debian-xen-ignore-xenpolicy-and-config.patch"
	patch -Np1 -i "${srcdir}/debian-xen-support-xsm.patch"
	patch -Np1 -i "${srcdir}/debian-xen-no-xsm-policy-in-non-xsm-options.patch"
	patch -Np1 -i "${srcdir}/debian-CVE-2020-10713.patch"
	patch -Np1 -i "${srcdir}/debian-safe-alloc-1.patch"
	patch -Np1 -i "${srcdir}/debian-safe-alloc-2.patch"
	patch -Np1 -i "${srcdir}/debian-safe-alloc-3.patch"
	patch -Np1 -i "${srcdir}/debian-safe-alloc-4.patch"
	patch -Np1 -i "${srcdir}/debian-iso9660-realloc-leak.patch"
	patch -Np1 -i "${srcdir}/debian-font-name-leak.patch"
	patch -Np1 -i "${srcdir}/debian-gfxmenu-load-image-double-free.patch"
	patch -Np1 -i "${srcdir}/debian-xnu-double-free.patch"
	patch -Np1 -i "${srcdir}/debian-lzma-overflow.patch"
	patch -Np1 -i "${srcdir}/debian-term-overflow.patch"
	patch -Np1 -i "${srcdir}/debian-udf-leak.patch"
	patch -Np1 -i "${srcdir}/debian-multiboot2-leak.patch"
	patch -Np1 -i "${srcdir}/debian-tftp-no-priority-queue.patch"
	patch -Np1 -i "${srcdir}/debian-relocator-chunk-addr-overflow.patch"
	patch -Np1 -i "${srcdir}/debian-relocator-chunk-align-underflow.patch"
	patch -Np1 -i "${srcdir}/debian-script-remove-unused-fields.patch"
	patch -Np1 -i "${srcdir}/debian-script-use-after-free.patch"
	patch -Np1 -i "${srcdir}/debian-relocator-chunk-align-fix-top.patch"
	patch -Np1 -i "${srcdir}/debian-hfsplus-overflow.patch"
	patch -Np1 -i "${srcdir}/debian-lvm-overflow.patch"
	patch -Np1 -i "${srcdir}/debian-emu-free-null.patch"
	patch -Np1 -i "${srcdir}/debian-efi-malformed-device-path.patch"
	patch -Np1 -i "${srcdir}/debian-efi-malformed-device-path-2.patch"
	patch -Np1 -i "${srcdir}/debian-safe-alloc-5.patch"
	patch -Np1 -i "${srcdir}/debian-efi-halt-reboot-use-after-free.patch"
	patch -Np1 -i "${srcdir}/debian-linux-loader-overflow.patch"
	patch -Np1 -i "${srcdir}/debian-linux-initrd-overflow.patch"
	patch -Np1 -i "${srcdir}/debian-bootp-alloc.patch"
	patch -Np1 -i "${srcdir}/debian-unix-config-overflow.patch"
	patch -Np1 -i "${srcdir}/debian-deviceiter-overflow.patch"
	patch -Np1 -i "${srcdir}/debian-osdep-exec-avoid-atexit-when-child-exits.patch"
	patch -Np1 -i "${srcdir}/debian-grub-install-backup-and-restore.patch"
	patch -Np1 -i "${srcdir}/debian-tftp-roll-over-block-counter.patch"
	patch -Np1 -i "${srcdir}/debian-mdraid1x-linux-gcc-10.patch"
	patch -Np1 -i "${srcdir}/debian-zfs-gcc-10.patch"
	patch -Np1 -i "${srcdir}/debian-uefi-firmware-efivarfs.patch"
	patch -Np1 -i "${srcdir}/debian-grub-install-inverted-nls-test.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-001-verifiers-Move-verifiers-API-to-kernel-image.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-002-kern-Add-lockdown-support.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-003-kern-lockdown-Set-a-variable-if-the-GRUB-is-locked-down.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-004-efi-Lockdown-the-GRUB-when-the-UEFI-Secure-Boot-is-enabled.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-005-efi-Use-grub_is_lockdown-instead-of-hardcoding-a-disabled-modules-list.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-006-acpi-Don-t-register-the-acpi-command-when-locked-down.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-007-mmap-Don-t-register-cutmem-and-badram-commands-when-lockdown-is-enforced.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-008-commands-Restrict-commands-that-can-load-BIOS-or-DT-blobs-when-locked-down.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-009-commands-setpci-Restrict-setpci-command-when-locked-down.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-010-commands-hdparm-Restrict-hdparm-command-when-locked-down.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-011-gdb-Restrict-GDB-access-when-locked-down.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-012-loader-xnu-Don-t-allow-loading-extension-and-packages-when-locked-down.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-013-docs-Document-the-cutmem-command.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-014-dl-Only-allow-unloading-modules-that-are-not-dependencies.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-015-usb-Avoid-possible-out-of-bound-accesses-caused-by-malicious-devices.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-016-mmap-Fix-memory-leak-when-iterating-over-mapped-memory.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-017-net-net-Fix-possible-dereference-to-of-a-NULL-pointer.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-018-net-tftp-Fix-dangling-memory-pointer.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-019-kern-parser-Fix-resource-leak-if-argc-0.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-020-kern-efi-Fix-memory-leak-on-failure.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-021-kern-efi-mm-Fix-possible-NULL-pointer-dereference.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-022-gnulib-regexec-Resolve-unused-variable.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-023-gnulib-regcomp-Fix-uninitialized-token-structure.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-024-gnulib-argp-help-Fix-dereference-of-a-possibly-NULL-state.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-025-gnulib-regexec-Fix-possible-null-dereference.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-026-gnulib-regcomp-Fix-uninitialized-re_token.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-027-io-lzopio-Resolve-unnecessary-self-assignment-errors.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-028-zstd-Initialize-seq_t-structure-fully.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-029-kern-partition-Check-for-NULL-before-dereferencing-input-string.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-030-disk-ldm-Make-sure-comp-data-is-freed-before-exiting-from-make_vg.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-031-disk-ldm-If-failed-then-free-vg-variable-too.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-032-disk-ldm-Fix-memory-leak-on-uninserted-lv-references.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-033-disk-cryptodisk-Fix-potential-integer-overflow.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-034-hfsplus-Check-that-the-volume-name-length-is-valid.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-035-zfs-Fix-possible-negative-shift-operation.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-036-zfs-Fix-resource-leaks-while-constructing-path.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-037-zfs-Fix-possible-integer-overflows.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-038-zfsinfo-Correct-a-check-for-error-allocating-memory.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-039-affs-Fix-memory-leaks.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-040-libgcrypt-mpi-Fix-possible-unintended-sign-extension.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-041-libgcrypt-mpi-Fix-possible-NULL-dereference.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-042-syslinux-Fix-memory-leak-while-parsing.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-043-normal-completion-Fix-leaking-of-memory-when-processing-a-completion.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-044-commands-hashsum-Fix-a-memory-leak.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-045-video-efi_gop-Remove-unnecessary-return-value-of-grub_video_gop_fill_mode_info.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-046-video-fb-fbfill-Fix-potential-integer-overflow.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-047-video-fb-video_fb-Fix-multiple-integer-overflows.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-048-video-fb-video_fb-Fix-possible-integer-overflow.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-049-video-readers-jpeg-Test-for-an-invalid-next-marker-reference-from-a-jpeg-file.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-050-gfxmenu-gui_list-Remove-code-that-coverity-is-flagging-as-dead.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-051-loader-bsd-Check-for-NULL-arg-up-front.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-052-loader-xnu-Fix-memory-leak.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-053-loader-xnu-Free-driverkey-data-when-an-error-is-detected-in-grub_xnu_writetree_toheap.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-054-loader-xnu-Check-if-pointer-is-NULL-before-using-it.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-055-util-grub-install-Fix-NULL-pointer-dereferences.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-056-util-grub-editenv-Fix-incorrect-casting-of-a-signed-value.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-057-util-glue-efi-Fix-incorrect-use-of-a-possibly-negative-value.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-058-script-execute-Fix-NULL-dereference-in-grub_script_execute_cmdline.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-059-commands-ls-Require-device_name-is-not-NULL-before-printing.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-060-script-execute-Avoid-crash-when-using-outside-a-function-scope.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-061-lib-arg-Block-repeated-short-options-that-require-an-argument.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-062-script-execute-Don-t-crash-on-a-for-loop-with-no-items.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-063-commands-menuentry-Fix-quoting-in-setparams_prefix.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-064-kern-misc-Always-set-end-in-grub_strtoull.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-065-video-readers-jpeg-Catch-files-with-unsupported-quantization-or-Huffman-tables.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-066-video-readers-jpeg-Catch-OOB-reads-writes-in-grub_jpeg_decode_du.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-067-video-readers-jpeg-Don-t-decode-data-before-start-of-stream.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-068-term-gfxterm-Don-t-set-up-a-font-with-glyphs-that-are-too-big.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-069-fs-fshelp-Catch-impermissibly-large-block-sizes-in-read-helper.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-070-fs-hfsplus-Don-t-fetch-a-key-beyond-the-end-of-the-node.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-071-fs-hfsplus-Don-t-use-uninitialized-data-on-corrupt-filesystems.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-072-fs-hfs-Disable-under-lockdown.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-073-fs-sfs-Fix-over-read-of-root-object-name.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-074-fs-jfs-Do-not-move-to-leaf-level-if-name-length-is-negative.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-075-fs-jfs-Limit-the-extents-that-getblk-can-consider.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-076-fs-jfs-Catch-infinite-recursion.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-077-fs-nilfs2-Reject-too-large-keys.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-078-fs-nilfs2-Don-t-search-children-if-provided-number-is-too-large.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-079-fs-nilfs2-Properly-bail-on-errors-in-grub_nilfs2_btree_node_lookup.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-080-io-gzio-Bail-if-gzio-tl-td-is-NULL.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-081-io-gzio-Add-init_dynamic_block-clean-up-if-unpacking-codes-fails.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-082-io-gzio-Catch-missing-values-in-huft_build-and-bail.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-083-io-gzio-Zero-gzio-tl-td-in-init_dynamic_block-if-huft_build-fails.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-084-disk-lvm-Don-t-go-beyond-the-end-of-the-data-we-read-from-disk.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-085-disk-lvm-Don-t-blast-past-the-end-of-the-circular-metadata-buffer.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-086-disk-lvm-Bail-on-missing-PV-list.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-087-disk-lvm-Do-not-crash-if-an-expected-string-is-not-found.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-088-disk-lvm-Do-not-overread-metadata.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-089-disk-lvm-Sanitize-rlocn-offset-to-prevent-wild-read.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-090-disk-lvm-Do-not-allow-a-LV-to-be-it-s-own-segment-s-node-s-LV.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-091-fs-btrfs-Validate-the-number-of-stripes-parities-in-RAID5-6.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-092-fs-btrfs-Squash-some-uninitialized-reads.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-093-kern-parser-Fix-a-memory-leak.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-094-kern-parser-Introduce-process_char-helper.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-095-kern-parser-Introduce-terminate_arg-helper.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-096-kern-parser-Refactor-grub_parser_split_cmdline-cleanup.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-097-kern-buffer-Add-variable-sized-heap-buffer.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-098-kern-parser-Fix-a-stack-buffer-overflow.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-099-kern-efi-Add-initial-stack-protector-implementation.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-100-util-mkimage-Remove-unused-code-to-add-BSS-section.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-101-util-mkimage-Use-grub_host_to_target32-instead-of-grub_cpu_to_le32.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-102-util-mkimage-Always-use-grub_host_to_target32-to-initialize-PE-stack-and-heap-stuff.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-103-util-mkimage-Unify-more-of-the-PE32-and-PE32-header-set-up.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-104-util-mkimage-Reorder-PE-optional-header-fields-set-up.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-105-util-mkimage-Improve-data_size-value-calculation.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-106-util-mkimage-Refactor-section-setup-to-use-a-helper.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-107-util-mkimage-Add-an-option-to-import-SBAT-metadata-into-a-.sbat-section.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-108-grub-install-common-Add-sbat-option.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-109-kern-misc-Split-parse_printf_args-into-format-parsing-and-va_list-handling.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-110-kern-misc-Add-STRING-type-for-internal-printf-format-handling.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-111-kern-misc-Add-function-to-check-printf-format-against-expected-format.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-112-gfxmenu-gui-Check-printf-format-in-the-gui_progress_bar-and-gui_label.patch"
	patch -Np1 -i "${srcdir}/debian-2021-02-security-113-kern-mm-Fix-grub_debug_calloc-compilation-error.patch"
	patch -Np1 -i "${srcdir}/debian-pc-verifiers-module.patch"
	patch -Np1 -i "${srcdir}/debian-enable_shim_lock_i386_efi.patch"
	patch -Np1 -i "${srcdir}/debian-debug_verifiers.patch"
	patch -Np1 -i "${srcdir}/debian-mkimage-fix-section-sizes.patch"
	patch -Np1 -i "${srcdir}/debian-tpm-unknown-error-non-fatal.patch"

	echo "Revert patch that handle the Debian kernel version numbers..."
	patch -Rp1 -i "${srcdir}/debian-dpkg-version-comparison.patch"

	echo "Patch to enable GRUB_COLOR_* variables in grub-mkconfig..."
	## Based on http://lists.gnu.org/archive/html/grub-devel/2012-02/msg00021.html
        patch -Np1 -i "${srcdir}/0001-00_header-add-GRUB_COLOR_-variables.patch"

	echo "Patch to detect of Arch Linux initramfs images by grub-mkconfig..."
        patch -Np1 -i "${srcdir}/0002-10_linux-detect-archlinux-initramfs.patch"

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
	gzip -cd "${srcdir}/unifont-${_unifont_ver}.bdf.gz" > "unifont.bdf"

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
