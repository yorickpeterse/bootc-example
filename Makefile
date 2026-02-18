container:
	podman build -t bootc-test .

installer-container:
	podman build -t bootc-installer installer

installer: container installer-container
	mkdir -p build
	podman run \
		--rm \
		--interactive \
		--tty \
		--privileged \
		--security-opt label=type:unconfined_t \
		--volume ./config.toml:/config.toml:ro \
		--volume ./build:/output \
		--volume /var/lib/containers/storage:/var/lib/containers/storage \
		quay.io/centos-bootc/bootc-image-builder:latest \
		--type bootc-installer \
		--installer-payload-ref localhost/bootc-test:latest \
		--use-librepo=True \
		--rootfs ext4 \
		--chown $$(id -u $$(logname)):$$(id -g $$(logname)) \
		localhost/bootc-installer:latest

clean:
	rm -rf build

.PHONY: container installer-container installer clean
