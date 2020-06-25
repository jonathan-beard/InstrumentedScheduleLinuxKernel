FROM ubuntu:19.10

RUN apt-get update -y && \
  apt-get install -y \
  build-essential \
  make \
  gcc \
  binutils-aarch64-linux-gnu \
  gcc-aarch64-linux-gnu \
  debianutils \
  file \
  gettext \
  kmod \
  po-debconf \
  util-linux \
  bc

ENV KERNEL_HOST_DIR linux-kernel-instrumented/
ARG USER_ID
ARG GROUP_ID
RUN addgroup -gid $GROUP_ID user
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID user
USER user
ADD ${KERNEL_HOST_DIR} /src

ENV KERNEL_SRC  /src/
ENV KERNEL_BLD  /build/
ENV KERNEL_MOD  /modules/

ENV TARGET      aarch64-linux-gnu
ENV KERNEL_ARCH arm64
ENV KERNEL_CONF defconfig
VOLUME /build
VOLUME /modules

COPY compile_kernel.sh /

CMD ["sh", "compile_kernel.sh"]
USER root
