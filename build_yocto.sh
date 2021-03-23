sudo apt-get install -y git build-essential python diffstat texinfo gawk chrpath dos2unix wget unzip socat doxygen libc6:i386 libncurses5:i386 libstdc++6:i386 libz1:i386
sudo dpkg-reconfigure dash

mkdir -p bin
if [ -d "bin/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf" ];
then
    echo "gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf already downloaded"
else
    wget https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/binrel/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf.tar.xz
    tar -Jxvf gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf.tar.xz -C bin
    rm gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf.tar.xz
fi
if [ -d "bin/gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu" ];
then
    echo "gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu already downloaded"
else
    wget https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/binrel/gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu.tar.xz
    tar -Jxvf gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu.tar.xz -C bin
    rm gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu.tar.xz
fi
export TOOLCHAIN_PATH_ARMV7=$PWD/bin/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf
export TOOLCHAIN_PATH_ARMV8=$PWD/bin/gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu

git clone git://arago-project.org/git/projects/oe-layersetup.git tisdk
cd tisdk && ./oe-layertool-setup.sh -f configs/processor-sdk/processor-sdk-dunfell-07.01.00.txt
cd build && . conf/setenv

cp ../../am335x-evm/sources/neo-ai-dlr.bb ../sources/meta-aws/recipes-neo-ai/neo-ai-dlr/

MACHINE=am335x-evm bitbake tisdk-base-image

