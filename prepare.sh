#!/bin/bash
echo "= preparing folder for PySide for Android build ="
echo "cloning Shiboken from Git"
git clone https://github.com/M4rtinK/shiboken-android.git
echo "switching to known-working commit"
cd shiboken-android
git checkout 72aeaf7d39a50ae31dd77a011e8913dce4606480
cd ..

echo "cloning PySide from Git"
git clone https://github.com/M4rtinK/pyside-android
echo "switching to known-working commit"
cd pyside-android
git checkout e0cfe7e768df33600d0e5114b84040650be5f582
cd ..

echo "creating needed folders"
mkdir "stage"
mkdir "shiboken-build"
mkdir "pyside-build"
echo "folder prepared for build, continue with build.sh"
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "!!! DONT FORGET TO SET THE PATH !!!"
echo "!!! TO Necessitas SDK in env.sh !!!"
echo "!!!  BEFORE STARTING THE BUILD  !!!"
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"