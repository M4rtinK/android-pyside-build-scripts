#!/bin/bash
echo "* fixing borked link paths in PySide *"
source env.sh

# due to missing SONAME in Qt libraries, shiboken & Python libs, CMAKE hardcoded absolute paths to the build
# these hardcoded paths need to be split like his:
# /foo/bar/libSpam.so
# becomes:
# -L/foo/bar -lSpam

TARGET_FOLDER="pyside-build"
STAGE_PATH="${BUILD_DIR}/stage"
STAGE_LIB_PATH="${STAGE_PATH}/lib"

echo "fixing libpyside link"
find ${TARGET_FOLDER} -name 'link.txt' -print0 | xargs -0 sed -i 's/..\/..\/libpyside\/libpyside.so/-L..\/..\/libpyside -lpyside/'
echo "fixing libshiboken link"
find ${TARGET_FOLDER} -name 'link.txt' -print0 | xargs -0 sed -i 's,${STAGE_PATH}/lib/libshiboken.so,,'
echo "fixing Python links"
find ${TARGET_FOLDER} -name 'link.txt' -print0 | xargs -0 sed -i 's,${PYTHON_DIR}/lib/libpython2.7.so,,'
echo "fixing Qt links"
find ${TARGET_FOLDER} -name 'link.txt' -print0 | xargs -0 sed -i "s,\(${QT_DIR}/lib/lib\)\([A-Za-z]*\).so,-L\1 -l\2,g"
echo "fixing done"

