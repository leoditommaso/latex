#!/bin/bash
set -e

MAKEFILE="/opt/Makefile"
WORKDIR=/data
TARGET="$@"

[ -d $WORKDIR ] && cd $WORKDIR

cp $MAKEFILE .

for file in $TARGET; do
  REL_DIR=`dirname $file` MAIN=`basename $file` OUT_FILE=`basename $file` make
done

rm Makefile
