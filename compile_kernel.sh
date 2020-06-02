cd $KERNEL_BLD && make ARCH=$KERNEL_ARCH -C $KERNEL_SRC O=$(pwd) defconfig
cd $KERNEL_BLD && \
make ARCH=$KERNEL_ARCH CROSS_COMPILE=$TARGET- V=1 -j`nproc` vmlinux modules
