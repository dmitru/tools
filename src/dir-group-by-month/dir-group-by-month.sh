#!/bin/bash

##
# dir-group-by-month: Group sub-files and sub-directories by month
##

DIR=$1
PREFIX=$2

if [[ -z $DIR ]]; then
  echo '❌ Usage: dir-group-by-month <directory> <prefix>'
  exit 1
fi

if [[ -z $PREFIX ]]; then
  echo '❌ Usage: dir-group-by-month <directory> <prefix>'
  exit 1
fi

cd "$DIR"

for FILE in *; do
  FILE_ABS=$DIR/$FILE

  if [[ -d "$FILE_ABS" && $FILE == $PREFIX* ]]; then
    echo "SKIPPING $FILE_ABS"
    continue
  fi

  # Secondary folder name
  # Get creation date of the file from OSX meta-data
  MONTH=$(mdls -raw -name kMDItemFSCreationDate "$FILE_ABS" | cut -d '-' -f 1 -f 2)

  DEST_DIR_REL=$PREFIX$MONTH
  DEST_DIR=$DIR/$DEST_DIR_REL

  if [ ! -d "$DEST_DIR" ]; then
    mkdir "$DEST_DIR"
  fi

  echo " - [processing]: $FILE_ABS to $DEST_DIR_REL"
  mv "$FILE_ABS" "$DEST_DIR_REL"
done
