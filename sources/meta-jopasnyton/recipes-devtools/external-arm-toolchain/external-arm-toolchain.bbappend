FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://git/arch/arm/boot/dts/am335x-icev2-common.dtsi;name=am335x-icev2-common"
SRC_URI += "file://git/arch/arm/boot/dts/am335x-icev2.dts;name=am335x-icev2"

LICENSE="MIT"
