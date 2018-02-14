#!/bin/sh

if [ $# != 1 ]; then
  echo 'help -- $1 must be modifier file path'
  exit 1
elif [ -e `pwd`/$1 ]; then
  PROF=`pwd`/$1
  EXT=${PROF##*.}
  echo $EXT
  if [ $EXT = 'yml' -o $EXT = 'yaml' ]; then
    if ! type yaml2json > /dev/null 2>&1; then
      if ! type npm > /dev/null 2>&1; then
        echo 'I will use npm. please setup NodeJS env.'
        exit 1
      fi
      npm install -g yaml2json
    fi
    JSON=${PROF%.*}.json
    yaml2json $PROF > JSON
  else
    JSON=$PROF
  fi
  echo $JSON ' exists ... OK'
  open 'karabiner://karabiner/assets/complex_modifications/import?url=file://'$JSON
fi
