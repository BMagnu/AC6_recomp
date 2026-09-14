#!/bin/bash
echo make sure you have required dependancies, including llvm, clang, ninja, etc.
echo This script is ment to be distro agnostic, so you are expected to know enough to figure out what you need.
echo also run me from the root of the repo
echo press enter to continue
read
if [[ ! -d assets ]]; then
	echo please copy required assets to the assets folder
	echo get the assets from a copy of the game
	mkdir assets
	exit 1
fi

rm -r out/build/linux-amd64-relwithdebinfo/*
cmake --preset linux-amd64-relwithdebinfo
cmake --build --preset linux-amd64-relwithdebinfo --target ac6recomp_codegen
cmake --preset linux-amd64-relwithdebinfo
cmake --build --preset linux-amd64-relwithdebinfo

mkdir out/finish/linux-amd64-relwithdebinfo -p
cp out/build/linux-amd64-relwithdebinfo/ac6recomp assets -r out/finish/linux-amd64-relwithdebinfo/

echo completed files copied to out/finish/linux-amd64-relwithdebinfo
