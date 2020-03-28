#!/bin/bash

echo "Cloning gluon framework"
git clone https://github.com/freifunk-gluon/gluon.git -b ${GLUON_VERSION} gluon

echo "Creating symlink site configuration"
ln -s /app/site/ gluon/site
echo "Updating gluon framework"
cd gluon && make update

echo "Building target"
cd gluon && make GLUON_TARGET=${GLUON_TARGET} -j4 V=s
