#!/bin/bash

sudo apt-get install -y git build-essential python diffstat texinfo gawk chrpath dos2unix wget unzip socat doxygen libc6:i386 libncurses5:i386 libstdc++6:i386 libz1:i386
if debconf-show dash | grep -q 'dash/sh: false'; then echo "bash already in use"; else sudo dpkg-reconfigure dash; fi

mkdir -p bin
if [ -d "bin/gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf" ]; then echo "gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf already downloaded"; else wget https://developer.arm.com/-/media/Files/downloads/gnu-a/8.3-2019.03/binrel/gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf.tar.xz; tar -Jxvf gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf.tar.xz -C bin; rm gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf.tar.xz; fi
if [ -d "bin/gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu" ]; then echo "gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu already downloaded"; else wget https://developer.arm.com/-/media/Files/downloads/gnu-a/8.3-2019.03/binrel/gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu.tar.xz; tar -Jxvf gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu.tar.xz -C bin; rm gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu.tar.xz; fi
export TOOLCHAIN_PATH_ARMV7=$PWD/bin/gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf
export TOOLCHAIN_PATH_ARMV8=$PWD/bin/gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu

if [ -d "tisdk" ]; then git -C tisdk checkout master; git -C tisdk pull; else git clone https://git.ti.com/git/arago-project/oe-layersetup.git tisdk; fi && git -C tisdk rev-parse --short HEAD
cp am335x-evm/sources/processor-sdk-06.03.00.106-config.txt tisdk/configs/processor-sdk/
cd tisdk && ./oe-layertool-setup.sh -f configs/processor-sdk/processor-sdk-06.03.00.106-config.txt

cd sources && if [ -d "meta-custom" ]; then git -C meta-custom/ checkout .; else git clone https://git.ti.com/git/sitara-linux/meta-custom.git -b proc-sdk-linux; fi && git -C meta-custom/ checkout Lab3-2018-04

cd ../.. && mkdir -p am335x-evm/build && cd am335x-evm/build && . ../conf/setenv

cp ../sources/meta-custom/conf/layer.conf ../../tisdk/sources/meta-custom/conf
cp ../sources/meta-custom/recipes-core/images/custom-base-image.bb ../../tisdk/sources/meta-custom/recipes-core/images

MACHINE=am335x-evm bitbake custom-base-image

