#! /bin/sh

if [ ! -e gcc-linaro-arm-linux-gnueabihf-4.7-2012.10-20121022_linux.tar.bz2 ]; then
   if [ ! -e gcc-linaro-arm-linux-gnueabihf-4.7-2012.10-20121022_linux.tar ]; then
      echo "Downloading..."
      wget https://launchpad.net/linaro-toolchain-binaries/trunk/2012.10/+download/gcc-linaro-arm-linux-gnueabihf-4.7-2012.10-20121022_linux.tar.bz2
      echo "Unzipping..."
      bunzip2 gcc-linaro-arm-linux-gnueabihf-4.7-2012.10-20121022_linux.tar.bz2
   fi
fi


if [ ! -e /opt/gcc-linaro-arm-linux-gnueabihf ]; then
   sudo mkdir /opt/gcc-linaro-arm-linux-gnueabihf
else
   echo "Cleaning..."
   sudo rm -rf /opt/gcc-linaro-arm-linux-gnueabihf/*
fi
echo "Untarring..."
sudo tar -C /opt/gcc-linaro-arm-linux-gnueabihf --strip=1 -xf gcc-linaro-arm-linux-gnueabihf-4.7-2012.10-20121022_linux.tar

echo "New path: "
echo $PATH
export PATH=$PATH:/opt/gcc-linaro-arm-linux-gnueabihf/bin
