
.PHONY: run

UID = $(shell id -u)
GID = $(shell id -g)

BLD_DIR ?= $(shell pwd)/build


$(BLD_DIR): Dockerfile compile_kernel.sh linux-kernel-instrumented
	rm -rf ${BLD_DIR}
	mkdir ${BLD_DIR}
	docker build \
		--build-arg USER_ID=${UID} \
		--build-arg GROUP_ID=${GID} \
		-t kernel-builder .

run: build
	docker run \
		-v ${BLD_DIR}:/build \
		--user "${UID}:${GID}" \
		-ti kernel-builder

bash: build
	docker run \
		-v $(shell pwd)/build:/build \
		-ti kernel-builder \
		/bin/bash
