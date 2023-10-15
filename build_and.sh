#!/bin/sh

SCRIPT="$0"
cd "`dirname "$0"`"

usage() {
	echo "Usage: $SCRIPT <path to android ndk>"
	exit 1
}

test -n "$1" || test -d "$1" || usage
export ANDROID_NDK_HOME="$1"
export ANDROID_ABI=21
export ANDROID_NDK="$ANDROID_NDK_HOME"
export ANDROID_NDK_ROOT="$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/sysroot"
export PATH="$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/bin/:$PATH"
echo PATH=$PATH

fail() {
	exit 1
}

build() {
	make DPTARGET=android CROSSPREFIX="$1" CXX="$2-clang++ -fPIC -I$ANDROID_NDK_ROOT/include/" CC="$2-clang -fPIC -I$ANDROID_NDK_ROOT/include/" ANDROID_ARCH="$3" "ANDROID_ABI=$ANDROID_ABI" AR=llvm-ar RANLIB=llvm-ranlib stand-alone-engine || fail
}

build i686-linux-android    "i686-linux-android$ANDROID_ABI"       x86
build x86_64-linux-android  "x86_64-linux-android$ANDROID_ABI"     x86_64
build aarch64-linux-android "aarch64-linux-android$ANDROID_ABI"    arm64-v8a
build arm-linux-androideabi "armv7a-linux-androideabi$ANDROID_ABI" armeabi-v7a
make DPTARGET=android stand-alone-data
