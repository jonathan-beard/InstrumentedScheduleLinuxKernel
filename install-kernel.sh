#!/bin/bash
qemu-system-aarch64 \
  -m 4096 \
  -M midway \
  -cpu cortex-a72 \
  -device -usb img/ubuntu-20.04-live-server-arm64.iso \
  -hda img/ubuntu.img \
