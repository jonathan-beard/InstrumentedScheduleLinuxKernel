cd $KERNEL_BLD && make ARCH=$KERNEL_ARCH -C $KERNEL_SRC O=$(pwd) defconfig
cd $KERNEL_BLD && \
make ARCH=$KERNEL_ARCH CROSS_COMPILE=$TARGET- V=1 -j`nproc`
cd $KERNEL_BLD && \
  make INSTALL_MOD_PATH=$KERNEL_MOD modules_install

