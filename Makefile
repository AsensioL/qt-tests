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
	@$(BUILD_FOLDER)/$(BINARY_NAME)

clean:
	rm -rf build


FORCE: ;