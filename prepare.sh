#!/bin/bash
echo "= preparing folder for PySide for Android build ="
echo "cloning Shiboken from Git"
git clone git@github.com:M4rtinK/shiboken-android.git
echo "switching to known-working commit"
git checkout 72aeaf7d39a50ae31dd77a011e8913dce4606480

echo "cloning PySide from Git"
git clone https://github.com/M4rtinK/pyside-android
echo "switching to known-working commit"
git checkout e0cfe7e768df33600d0e5114b84040650be5f582

echo "creating needed folders"
mkdir "stage"
mkdir "shiboken build"
mkdir "pyside-build"
echo "folder prepared for build, continue with build.sh"