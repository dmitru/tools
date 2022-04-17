#!/bin/bash

##
# dir-ungroup-by-month: Ungroup sub-files and sub-directories by month
##

DIR=$1
PREFIX=$2 || ''

if [[ -z $DIR ]]; then
  echo '❌ Usage: dir-ungroup-by-month <directory> [<prefix>]'
  exit 1
fi

if [[ -z $PREFIX ]]; then
  echo '❌ Usage: dir-group-by-month <directory> <prefix>'
  exit 1
fi

cd "$DIR"

# set -o globcomplete
shopt -s nullglob

for FILE in $PREFIX*; do
  # Secondary folder name
  DEST_DIR=$DIR/$FILE

  if [ -d "$DEST_DIR" ]; then
    for FILE2 in "$DEST_DIR"/$FILE/*; do
      mv "$FILE2" "$DIR"
    done
    rmdir "$DEST_DIR"/$FILE
    rmdir "$DEST_DIR"
  fi

done
