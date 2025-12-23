cat > layers/meta-custom/recipes-kernel/linux/linux-raspberrypi_%.bbappend << 'EOF'
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI:append = " file://waydroid.cfg"
KERNEL_MODULE_AUTOLOAD:append = " binder_linux ashmem_linux"
EOF