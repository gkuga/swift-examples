BASEPATH     := Carthage/Build/ReSwift.xcframework/macos-arm64_x86_64
MODULE_PATH  := $(BASEPATH)/ReSwift.framework/Modules
LIBRARY_PATH := $(BASEPATH)/ReSwift.framework/ReSwift

SWIFTC  := swiftc
PROGRAM := main

all: $(PROGRAM)

main: main.o 
	swiftc -emit-executable main.o $(LIBRARY_PATH) -Xlinker -rpath -Xlinker $(BASEPATH)

main.o: main.swift Carthage
	swiftc -c main.swift -I $(MODULE_PATH)

Carthage:
	carthage update --use-xcframeworks --platform macOS

.PHONY: clean
clean:
	rm -rf *.o main Carthage
