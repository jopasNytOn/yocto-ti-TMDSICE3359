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

if debconf-show dash | grep -q 'dash/sh: false'; then echo "dash already in use"; else sudo dpkg-reconfigure dash; fi
mkdir -p bin
if [ -d "bin/gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf" ]; then echo "gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf already downloaded"; else wget https://developer.arm.com/-/media/Files/downloads/gnu-a/8.3-2019.03/binrel/gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf.tar.xz; tar -Jxvf gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf.tar.xz -C bin; rm gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf.tar.xz; fi
if [ -d "bin/gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu" ]; then echo "gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu already downloaded"; else wget https://developer.arm.com/-/media/Files/downloads/gnu-a/8.3-2019.03/binrel/gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu.tar.xz; tar -Jxvf gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu.tar.xz -C bin; rm gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu.tar.xz; fi
export TOOLCHAIN_PATH_ARMV7=$PWD/bin/gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf
export TOOLCHAIN_PATH_ARMV8=$PWD/bin/gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu
if [ -d "tisdk" ]; then echo "tisdk already cloned"; else git clone git://arago-project.org/git/projects/oe-layersetup.git tisdk; fi
cd tisdk && ./oe-layertool-setup.sh -f configs/processor-sdk/processor-sdk-06.03.00.106-config.txt
cd build && . conf/setenv
MACHINE=am335x-evm bitbake arago-base-tisdk-image
cd ../.. && if [ -d "artifacts" ]; then rm -rf artifacts; fi && mkdir -p artifacts
cp tisdk/build/arago-tmp-external-arm-toolchain/deploy/images/am335x-evm/* artifacts
*/