# Docker image for STP

DOCKER_STP_STEM = docker-stp
DOCKER_STP = $(DOCKER_STP_STEM).gz
DOCKER_STP_DBG = $(DOCKER_STP_STEM)-$(DBG_IMAGE_MARK).gz

$(DOCKER_STP)_PATH = $(DOCKERS_PATH)/$(DOCKER_STP_STEM)

$(DOCKER_STP)_DEPENDS += $(STP) $(SWSS)
$(DOCKER_STP)_DBG_DEPENDS = $($(DOCKER_CONFIG_ENGINE_BULLSEYE)_DBG_DEPENDS)
$(DOCKER_STP)_DBG_DEPENDS += $(STP) $(SWSS)

$(DOCKER_STP)_DBG_IMAGE_PACKAGES = $($(DOCKER_CONFIG_ENGINE_BULLSEYE)_DBG_IMAGE_PACKAGES)

ifeq ($(INCLUDE_STP), y)
SONIC_DOCKER_IMAGES += $(DOCKER_STP)
SONIC_INSTALL_DOCKER_IMAGES += $(DOCKER_STP)

SONIC_DOCKER_DBG_IMAGES += $(DOCKER_STP_DBG)
SONIC_INSTALL_DOCKER_DBG_IMAGES += $(DOCKER_STP_DBG)
endif

$(DOCKER_STP)_LOAD_DOCKERS = $(DOCKER_CONFIG_ENGINE_BULLSEYE)

$(DOCKER_STP)_CONTAINER_NAME = stp
$(DOCKER_STP)_RUN_OPT += --net=host --privileged -t
$(DOCKER_STP)_RUN_OPT += -v /etc/sonic:/etc/sonic:ro
$(DOCKER_STP)_RUN_OPT += -v /host/warmboot:/var/warmboot

$(DOCKER_STP)_BASE_IMAGE_FILES += stpctl:/usr/bin/stpctl
