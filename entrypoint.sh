#!/bin/bash
set -e

MAKEFILE="/opt/Makefile"
WORKDIR=/data
TARGET="$@"

[ -d $WORKDIR ] && cd $WORKDIR

cp $MAKEFILE .

for file in $TARGET; do
  REL_DIR=`dirname $file` MAIN=`basename $file | cut -d '.' -f1` make
done

rm Makefile
