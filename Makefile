PROJECT_FILE = MyProject.pro

BINARY_NAME = MyProject

ROOT_FOLDER = $(shell pwd)

BUILD_FOLDER = $(ROOT_FOLDER)/build

default: all

all: run_qmake build

run_qmake: $(PROJECT_FILE)
	@echo "Running qmake"
	@mkdir -p $(BUILD_FOLDER)
	@(cd $(BUILD_FOLDER) && qmake $(ROOT_FOLDER))

build: run_qmake FORCE
	@echo "Running make"
	@(cd $(BUILD_FOLDER) && make)

run: build
	@QT_QPA_PLATFORM=xcb QT_MEDIA_BACKEND=gstreamer bash -c '$(BUILD_FOLDER)/$(BINARY_NAME)'

package:
	@cp $(BUILD_FOLDER)/$(BINARY_NAME) /mnt/c/shared/qt-test/
	@cp -r $(ROOT_FOLDER)/qml          /mnt/c/shared/qt-test/
	@cp -r $(ROOT_FOLDER)/extras/*     /mnt/c/shared/qt-test/
	@echo "Data copied to C:\shared\qt-test"

clean:
	rm -rf build


FORCE: ;