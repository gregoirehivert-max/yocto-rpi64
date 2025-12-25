SUMMARY = "Waydroid setup script for Raspberry Pi"
DESCRIPTION = "Script to install Waydroid from official repository"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://setup-waydroid.sh \
           file://waydroid-setup.service"

S = "${WORKDIR}"

inherit systemd

SYSTEMD_SERVICE:${PN} = "waydroid-setup.service"
SYSTEMD_AUTO_ENABLE = "enable"

RDEPENDS:${PN} = "bash curl ca-certificates lsb-release"

do_install() {
    install -d ${D}${bindir}
    install -m 0755 ${WORKDIR}/setup-waydroid.sh ${D}${bindir}/setup-waydroid
    
    install -d ${D}${systemd_system_unitdir}
    install -m 0644 ${WORKDIR}/waydroid-setup.service ${D}${systemd_system_unitdir}/
}

FILES:${PN} = "${bindir}/setup-waydroid"