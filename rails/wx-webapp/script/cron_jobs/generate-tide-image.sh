#!/bin/sh

IMAGE_DIR=$HOME/apps/wx-webapp/shared/images
FILE=$IMAGE_DIR/tides.png

rm -f $FILE

/usr/bin/tide -l "Beverly, Massachusetts" -f p -m g -o $FILE >/dev/null 2>/dev/null
