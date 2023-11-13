#!/bin/bash

set -ex

mkdir build
cd build

# Configure
cmake $SRC_DIR -DCMAKE_BUILD_TYPE=Release \
               -DOPENMM_DIR=$PREFIX \
               -DCMAKE_INSTALL_PREFIX=$PREFIX

# Build and install C++ components
cmake --build .
cmake --install .

# Build and install Python components
cmake --build . -- PythonInstall

# Build and install Python components
# Include test executables too
#mkdir -p ${PREFIX}/share/${PKG_NAME}/tests
#if [[ "$target_platform" == osx* ]]; then
#    find . -name 'Test*' -perm +0111 -type f -exec cp {} ${PREFIX}/share/${PKG_NAME}/tests/ \;
#else
#    find . -name 'Test*' -executable -type f -exec cp {} ${PREFIX}/share/${PKG_NAME}/tests/ \;
#fi
#cp -r tests ${PREFIX}/share/${PKG_NAME}/tests/
#ls -al ${PREFIX}/share/${PKG_NAME}/tests/
