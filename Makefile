CONFIG_REPOSITORY ?= https://gitea.indie-freifunk.net/oszilloskop/site-ffffm.git#
CONFIG_BRANCH ?= top#
DOCKER_IMAGE_VERSION ?= abc
BUILD_TARGETS ?= ar71xx-generic \
	ar71xx-tiny \
	ar71xx-nand \
	ath79-generic \
	brcm2708-bcm2708 \
	brcm2708-bcm2709 \
	ipq40xx-generic \
	ipq806x-generic \
	lantiq-xrx200 \
	lantiq-xway \
	mpc85xx-generic \
	mpc85xx-p1020 \
	ramips-mt7620 \
	ramips-mt7621 \
	ramips-mt76x8 \
	ramips-rt305x \
	sunxi-cortexa7 \
	x86-generic \
	x86-geode \
	x86-64

.PHONY: build-container
build-container:
	docker build . -t gluon-firmware-automation:${DOCKER_IMAGE_VERSION}

.PHONY: clone-config
clone-config:
	git clone ${CONFIG_REPOSITORY} -b ${CONFIG_BRANCH} site

.PHONY: build-targets
build-targets:
	$(foreach target,$(BUILD_TARGETS),echo $(target);)
