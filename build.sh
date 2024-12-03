#!/bin/bash

XCF_DIR=`pwd`
XCF_INCLUDE="$XCF_DIR/include"

mkdir -p $XCF_INCLUDE

set -e

buildIden3Lib() {
  echo "Building iden3 C library..."

  IDEN3CLIB_DIR="$XCF_DIR/../c-polygonid"
  IDEN3CLIB_LIBS="$XCF_DIR/iden3clib/libs"
  IDEN3CLIB_TARGET="Iden3CLibrary.xcframework"

  cd $XCF_DIR

  rm -f $IDEN3CLIB_LIBS/*.a
  rm -Rf $IDEN3CLIB_TARGET

  cd $IDEN3CLIB_DIR
  git pull

  make ios-simulator
  make ios
  make darwin-arm64

  cp ios/libpolygonid.h "$XCF_INCLUDE"

  mkdir -p $IDEN3CLIB_LIBS
  cp ios/libpolygonid-darwin-arm64.a $IDEN3CLIB_LIBS/libpolygonid-macos.a
  cp ios/libpolygonid-ios.a $IDEN3CLIB_LIBS/libpolygonid-ios.a
  cp ios/libpolygonid-ios-simulator.a $IDEN3CLIB_LIBS/libpolygonid-ios-sim.a

  echo "Building xcframework..."
  cd "$XCF_DIR"
  xcodebuild -verbose -create-xcframework \
    -output $IDEN3CLIB_TARGET \
    -library $IDEN3CLIB_LIBS/libpolygonid-macos.a \
    -headers ./include/ \
    -library $IDEN3CLIB_LIBS/libpolygonid-ios-sim.a \
    -headers ./include/ \
    -library $IDEN3CLIB_LIBS/libpolygonid-ios.a \
    -headers ./include/
}

buildIden3Lib
