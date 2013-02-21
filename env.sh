#!/bin/bash

export NECESSITAS_DIR="<path to the Necessitas SDK folder>"
# The Necessitas SDK contains not only Qt libraries built for Android, but also an
# Android NDK, that can be used to build Shiboken & PySide for Android
export ANDROID_NDK="${NECESSITAS_DIR}/android-ndk"
export QT_DIR="${NECESSITAS_DIR}/Android/Qt/482/armeabi/"
export ANDROID_PLATFORM_NUMBER="14"
export BUILD_DIR=`pwd`

# Path to Python compiled for Android
# NOTE: modify this if want to use custom a Python build
export PYTHON_DIR="${BUILD_DIR}/android_python"
PYTHON_INCLUDES="-I${PYTHON_DIR}/include"
PYTHON_LIBS="-L${PYTHON_DIR}/lib"
PYTHON_LIBRARY="-L${PYTHON_DIR}/lib/libpython2.7.so"

# add the stage libs, so that when building PySide, it can find the shiboken library
STAGE_LIBS="-L${BUILD_DIR}/stage/lib"

# add the Android STL to the build parameters
STL_TYPE="gnu-libstdc++" # are the other STL types even usable ?
STL_PATH="${ANDROID_NDK}/sources/cxx-stl/${STL_TYPE}"
STL_INCLUDES="-I${STL_PATH}/4.4.3/include -I${STL_PATH}/4.4.3/libs/armeabi/include"
STL_RAW_INCLUDES="${STL_PATH}/4.4.3/include:${STL_PATH}/4.4.3/libs/armeabi/include"
STL_LIBS="-L${STL_PATH}/4.4.3/libs/armeabi"

# make sure ctypes are included
CTYPE_INCLUDES="-I${ANDROID_NDK}/platforms/android-${ANDROID_PLATFORM_NUMBER}/arch-arm/usr/include"
CTYPE_INCLUDES_RAW="${ANDROID_NDK}/platforms/android-${ANDROID_PLATFORM_NUMBER}/arch-arm/usr/include"
ANDROID_INCLUDES="${ANDROID_NDK}/platforms/android-${ANDROID_PLATFORM_NUMBER}/arch-arm/usr/include:${STL_RAW_INCLUDES}"
ANDROID_SYSROOT="${ANDROID_NDK}/platforms/android-${ANDROID_PLATFORM_NUMBER}/arch-arm"

export MAKEFLAGS="-I${ANDROID_INCLUDES}"
export INCLUDE=${ANDROID_INCLUDES}
export C_INCLUDE_PATH=${ANDROID_INCLUDES}
export CPLUS_INCLUDE_PATH=${ANDROID_INCLUDES}

ANDROID_BIN="${ANDROID_NDK}/toolchains/arm-linux-androideabi-4.4.3/prebuilt/linux-x86/bin/"

export ANDROID_NDK=/home/melf-san/data/coding/SDK/android/necessitas/android-ndk
export PATH="${ANDROID_BIN}:${ANDROID_NDK}:${ANDROID_NDK}/tools:$PATH"
export PATH="${QT_DIR}/bin:$PATH"
export ARCH="armeabi"
export CFLAGS="-DANDROID -mandroid -fomit-frame-pointer -pipe --sysroot ${ANDROID_SYSROOT}"
SHIBOKEN_INCLUDE="-I${BUILD_DIR}/stage/include/shiboken"
export CXXFLAGS="${CTYPE_INCLUDES} ${CFLAGS} ${STL_LIBS} ${STL_INCLUDES} ${CTYPE_INCLUDES} ${SHIBOKEN_INCLUDE} ${PYTHON_INCLUDES} ${STAGE_LIBS} -fPIC -fvisibility=hidden -Wno-strict-aliasing -rdynamic"

#export LDFLAGS="--sysroot $ANDROID_NDK/platforms/android-14/arch-arm ${PYTHON_LIBZ} -Wl,-O1 -nostdlib -shared -lpython2.7 -lstdc++ -lc -lm"
#export LDFLAGS="--sysroot $ANDROID_NDK/platforms/android-14/arch-arm ${PYTHON_LIBZ} -nostdlib -shared -lpython2.7 -lstdc++ -lc -lm"
export LDFLAGS="--sysroot ${ANDROID_SYSROOT} ${PYTHON_LIBS} -nostdlib -shared -Wno-strict-aliasing -Wl,-O1 -Wl,-z,noexecstack -Wl,-shared,-Bsymbolic -Wl,--no-whole-archive -L${QT_DIR}/lib -lQtCore -lpython2.7 -lstdc++ -lsupc++ -lgcc -llog -lz -lm -ldl -lc"
export CC="${ANDROID_BIN}/arm-linux-androideabi-gcc"
export CXX="${ANDROID_BIN}/arm-linux-androideabi-g++"
export AR="${ANDROID_BIN}/arm-linux-androideabi-ar"
export RANLIB="${ANDROID_BIN}/arm-linux-androideabi-ranlib"
export LD="${ANDROID_BIN}/arm-linux-androideabi-ld"
export STRIP="${ANDROID_BIN}/arm-linux-androideabi-strip --strip-unneeded"

#unset CPLUS_INCLUDE_PATH
#unset C_INCLUDE_PATH
