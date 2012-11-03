#! /bin/sh
export PATH=$PATH:/opt/gcc-linaro-arm-linux-gnueabihf/bin

if [ ! -e stable-kernel ]; then
   git clone git://github.com/RobertCNelson/stable-kernel.git
fi

cd stable-kernel/
./build_kernel.sh
