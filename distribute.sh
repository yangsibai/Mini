#!/bin/bash

rm -R -f ./bin
mkdir ./bin
cp -r ./Atom/Atom.app bin/
mkdir ./bin/Atom.app/Contents/Resources/app
cp ./*.js bin/Atom.app/Contents/Resources/app
cp ./*.css bin/Atom.app/Contents/Resources/app
cp ./*.html bin/Atom.app/Contents/Resources/app
cp ./package.json bin/Atom.app/Contents/Resources/app
cp -r node_modules bin/Atom.app/Contents/Resources/app
mv ./bin/Atom.app ./bin/Vanga.app
echo 'done!'
