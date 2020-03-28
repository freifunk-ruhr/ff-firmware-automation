#!/bin/bash

echo "Cloning gluon framework"
mkdir -p gluon
git clone https://github.com/freifunk-gluon/gluon.git -b ${GLUON_VERSION} gluon.tmp
mv gluon.tmp/.git gluon/
rm -rf gluon.tmp
cd gluon
git reset --hard HEAD && git pull

echo "Creating symlink site configuration"
ln -s /app/site/ site
echo "Updating gluon framework"
make update

echo "Building target"
make GLUON_TARGET=${GLUON_TARGET} -j ${GLUON_CORES} V=s
