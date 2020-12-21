#!/bin/sh

# page to scrape the TEI URLs from
INDEX_URL="http://theatre-classique.fr/pages/programmes/PageEdition.php"

# directory with original downloads
TARGET_DIR=./xml

LYNX="lynx -listonly -nonumbers -dump $INDEX_URL"
GREP="grep /pages/documents/"

if ! [ -d $TARGET_DIR ]; then
  mkdir -p $TARGET_DIR
else
  echo "Directory $TARGET_DIR exists."
  echo "For a fresh download remove files in that directory."
  echo
fi

# retrieve TEI files from Theatre Classique
for url in $($LYNX | $GREP); do
  name=$(basename $url | sed 's/\.[Xx][Mm][Ll]$//' | sed 's/%20//g')
  file="$TARGET_DIR/$name.xml"

  if ! [ -f $file ]; then
    wget -O $file $url
    # add newline to end of originals for cleaner diffs
    echo >> $file
  fi
done
