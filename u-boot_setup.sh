#! /bin/sh
export PATH=$PATH:/opt/gcc-linaro-arm-linux-gnueabihf/bin

if [ ! -e u-boot-2012.04.01.tar.bz2 ]; then
	if [ ! -e u-boot-2012.04.01.tar ]; then
		wget ftp://ftp.denx.de/pub/u-boot/u-boot-2012.04.01.tar.bz2
		bunzip2 u-boot-2012.04.01.tar.bz2
	fi
fi

if [ ! -e u-boot-2012.04.01 ]; then
	tar -xvf u-boot-2012.04.01.tar
	cd u-boot-2012.04.01/
	wget https://raw.github.com/RobertCNelson/Bootloader-Builder/master/patches/v2012.04/0001-enable-bootz-support-for-ti-omap-targets.patch
	wget https://raw.github.com/RobertCNelson/Bootloader-Builder/master/patches/v2012.04/0001-panda-convert-to-uEnv.txt-bootscript.patch
	wget https://raw.github.com/RobertCNelson/Bootloader-Builder/master/patches/v2012.04/0003-panda-let-the-bootloader-set-the-intial-screen-resol.patch
 
	patch -p1 < 0001-enable-bootz-support-for-ti-omap-targets.patch
	patch -p1 < 0001-panda-convert-to-uEnv.txt-bootscript.patch
	patch -p1 < 0003-panda-let-the-bootloader-set-the-intial-screen-resol.patch
   cd -
fi


cd u-boot-2012.04.01/
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- omap4_panda_config
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-

