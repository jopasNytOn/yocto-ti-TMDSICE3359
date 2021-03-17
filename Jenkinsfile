node {
    stage('Build') {
        echo 'Building....'
    }
    stage('Test') {
        echo 'Testing....'
    }
    stage('Deploy') {
        echo 'Deploying....'
    }
}

/*
Commands in Execute shell for Jenkins Freestyle project

if debconf-show dash | grep -q 'dash/sh: false'; then echo "bash already in use"; else sudo dpkg-reconfigure dash; fi
mkdir -p bin
if [ -d "bin/gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf" ]; then echo "gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf already downloaded"; else wget https://developer.arm.com/-/media/Files/downloads/gnu-a/8.3-2019.03/binrel/gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf.tar.xz; tar -Jxvf gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf.tar.xz -C bin; rm gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf.tar.xz; fi
if [ -d "bin/gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu" ]; then echo "gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu already downloaded"; else wget https://developer.arm.com/-/media/Files/downloads/gnu-a/8.3-2019.03/binrel/gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu.tar.xz; tar -Jxvf gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu.tar.xz -C bin; rm gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu.tar.xz; fi
export TOOLCHAIN_PATH_ARMV7=$PWD/bin/gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf
export TOOLCHAIN_PATH_ARMV8=$PWD/bin/gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu
if [ -d "tisdk" ]; then git -C tisdk checkout master; git -C tisdk pull; else git clone git://arago-project.org/git/projects/oe-layersetup.git tisdk; fi && git -C tisdk rev-parse --short HEAD
cd tisdk && ./oe-layertool-setup.sh -f configs/processor-sdk/processor-sdk-06.03.00.106-config.txt
cd sources && if [ -d "meta-custom" ]; then git -C meta-custom/ checkout .; else git clone git://git.ti.com/sitara-linux/meta-custom.git -b proc-sdk-linux; fi && git -C meta-custom/ checkout Lab3-2018-04
cd ../.. && mkdir -p am335x-evm/build && cd am335x-evm/build && . ../conf/setenv
cp ../sources/meta-custom/conf/layer.conf ../../tisdk/sources/meta-custom/conf
cp ../sources/meta-custom/recipes-core/images/custom-base-image.bb ../../tisdk/sources/meta-custom/recipes-core/images
MACHINE=am335x-evm bitbake custom-base-image
cd ../.. && if [ -d "artifacts" ]; then rm -rf artifacts; fi && mkdir -p artifacts
cp am335x-evm/build/arago-tmp-external-arm-toolchain/deploy/images/am335x-evm/* artifacts
*/
