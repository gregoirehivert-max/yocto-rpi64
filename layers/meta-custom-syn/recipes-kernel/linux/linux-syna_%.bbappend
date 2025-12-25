FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI:append = " file://waydroid.cfg"
KERNEL_MODULE_AUTOLOAD:append = " binder_linux ashmem_linux"