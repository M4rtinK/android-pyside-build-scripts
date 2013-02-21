#!/bin/bash
echo "= preparing folder for PySide for Android build ="
echo "cloning Shiboken from Git"
git clone https://github.com/M4rtinK/shiboken-android.git
echo "switching to known-working commit"
cd shiboken-android
git checkout 9354fed4970134371df9057bb56453467319c788
cd ..

echo "cloning PySide from Git"
git clone https://github.com/M4rtinK/pyside-android
echo "switching to known-working commit"
cd pyside-android
git checkout 6109db3afeea91c9404586607de86c670142a0d1
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