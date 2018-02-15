#!/bin/sh
# macOS Only
if [ $# != 1 ]; then
  echo 'help -- $1 must be modifier file path'
  exit 1
elif [ -e `pwd`/$1 ]; then
  PROF=`pwd`/$1
  EXT=${PROF##*.}
  echo $EXT
  if [ $EXT = 'yml' -o $EXT = 'yaml' ]; then
    if ! type remarshal > /dev/null 2>&1; then
      if ! type brew > /dev/null 2>&1; then
        echo 'I will use homebrew. please setup brew env. https://brew.sh/'
        exit 1
      fi
      brew install remarshal
    fi
    JSON=${PROF%.*}.json
    if ! yaml2json $PROF > $JSON; then
      echo 'Maybe' $PROF 'has something wrong...'
      exit 1
    fi
  else
    JSON=$PROF
  fi
  echo $JSON ' exists ... OK'
  open 'karabiner://karabiner/assets/complex_modifications/import?url=file://'$JSON
fi
