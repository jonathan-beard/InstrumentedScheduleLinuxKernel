
.PHONY: run

UID = $(shell id -u)
GID = $(shell id -g)

BLD_DIR ?= $(shell pwd)/build
KBL_DIR = ${BLD_DIR}/kbld
MOD_DIR = ${BLD_DIR}/kmod

$(KBL_DIR):
	mkdir -p $@

$(MOD_DIR):
	mkdir -p $@

$(BLD_DIR): Dockerfile compile_kernel.sh linux-kernel-instrumented
	BLD_DIR=${BLD_DIR} make ${KBL_DIR} ${MOD_DIR}
	docker build \
		--build-arg USER_ID=${UID} \
		--build-arg GROUP_ID=${GID} \
		-t kernel-builder .

run: $(BLD_DIR)
	docker run \
		-v ${KBL_DIR}:/build \
		-v ${MOD_DIR}:/modules \
		--user "${UID}:${GID}" \
		-ti kernel-builder

bash: $(BLD_DIR)
	docker run \
		-v ${KBL_DIR}:/build \
		-v ${MOD_DIR}:/modules \
		-ti kernel-builder \
		/bin/bash
