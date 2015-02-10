#! /bin/sh

git reset --hard
git clean -fd .
git submodule foreach --recursive git reset --hard
git submodule foreach --recursive git clean -fd .

rm -rf PROJECTNAME.xcodeproj
git checkout .
