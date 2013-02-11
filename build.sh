#!/bin/bash

echo "= Combined Shiboken & PySide Android build script"
echo "* Shiboken will be built first, followed by PySide *"

./build_shiboken.sh
./build_pyside.sh

echo "* combined Android build done *"
