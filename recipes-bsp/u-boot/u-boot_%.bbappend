# Teach U-Boot to boot the signed FIT that secure boot produces.
#
# EmbedForge sets KERNEL_IMAGETYPE to fitImage and KERNEL_BOOTCMD to bootm when
# a template asks for U-Boot FIT signing. That describes the image; nothing in
# it makes the board's bootloader able to read one, and CONFIG_FIT is off by
# default in U-Boot. The result was a build that succeeded, an image that
# looked complete, and a board that stopped at the U-Boot prompt.
#
# Applied only when the build signs. A template that does not ask for secure
# boot gets the board's U-Boot configuration untouched, because turning on
# FIT_SIGNATURE also turns off LEGACY_IMAGE_FORMAT, and that is a change no
# unsigned build asked for.
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "${@' file://embedforge-fit-verified-boot.cfg' if d.getVar('UBOOT_SIGN_ENABLE') == '1' else ''}"
