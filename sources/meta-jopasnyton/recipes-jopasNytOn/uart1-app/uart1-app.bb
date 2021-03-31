SRC_URI = " \
    file://uart1-app.c \
    file://Makefile \
    file://LICENSE \
"

LICENSE="GPLv2"
LIC_FILES_CHKSUM = "file://LICENSE;md5=f73069ee5fe10af114e5300a37d32d44"

S = "${WORKDIR}"

EXTRA_OEMAKE += "all"

do_install() {
    install -d ${D}${bindir}
    install -m 0755 ${S}/uart1-app ${D}${bindir}
}

FILES_${PN} += "${bindir}/uart1-app"

