#!/bin/bash

usage ()
{
  echo 'Usage : snoop pingIP namebucket script tempdir'
  echo '   pingIP : HTTP URL to GET for ping'
  echo '   namebucket : name of the Google Cloud Storage bucket for screencapture upload'
  echo '   namegithubrepo : script to GET for execution'
  echo '   tempdir : temp directory for image manipulation'
  echo '   '

  exit
}

if [ "$#" -ne 4 ]
then
  usage
fi

PINGIP=$1
BUCKET=$2
REPO=$3
TEMP=$4
NOW=$(date +"%H%M")
FILE="gs://$BUCKET/screencapture/screencapture.$NOW.png"
curl $PINGIP
curl -s "https://raw.githubusercontent.com/$REPO/master/script.sh" | bash -s --
/usr/sbin/screencapture -x "$TEMP/screen.png"
/usr/local/bin/convert "$TEMP/screen.png" -scale 30% "$TEMP/screensmall.png"
/Users/DidierGirard/google-cloud-sdk/bin/gsutil cp "$TEMP/screensmall.png" $FILE

