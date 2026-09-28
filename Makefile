DIR := $(shell pwd)
BUILD_DIR := $(DIR)/build

all:
	mkdir -p $(BUILD_DIR)
	cp -r $(DIR)/src/files $(DIR)/src/module.prop $(DIR)/src/post-fs-data.sh $(BUILD_DIR)/
	cd $(BUILD_DIR)/files/bootanimation && zip -r -0 ../bootanimation.zip ./*
	rm -rf $(BUILD_DIR)/files/bootanimation
	cd $(BUILD_DIR) && zip -r -9 $(BUILD_DIR)/apple-electrocution-bootanimation.zip ./*
	echo "Build completed. The output file is located at $(BUILD_DIR)/apple-electrocution-bootanimation.zip"

clean:
	rm -rf $(BUILD_DIR)