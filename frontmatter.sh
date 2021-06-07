#!/bin/bash

DIR="./meta-data"
DST="./modules"

mkdir "$DST"

for i in $(ls -d ./meta-data/*); do

  moduleFile="$i"/module.txt
  if [ -f "$moduleFile" ]; then
    moduleName=$(cat "$moduleFile" |  grep -Po '"id" *\K: *\K"[^"]*"' |sed 's/"//g' | head -n1)
    moduleAuthor=$(cat "$moduleFile" |  grep -Po '"author" *\K: *\K"[^"]*"' |sed 's/"//g')
    moduleDisplayname=$(cat "$moduleFile" | grep -Po '"displayName" *\K: *\K"[^"]*"' |sed 's/"//g')
    moduleDescription=$(cat "$moduleFile" | grep -Po '"description" *\K: *\K"[^"]*"' |sed 's/"//g')
    moduleLogo="$i"/logo.png
    modulecover="$i"/cover.png
    modulereadme="$i"/README.md

    mkdir "$DST"/"$moduleName"
    touch "$DST"/"$moduleName"/index.md
    echo "---" >"$DST"/"$moduleName"/index.md
    echo "posttype:  \"module\"  " >>"$DST"/"$moduleName"/index.md
    echo "title: \"$moduleDisplayname\"" >>"$DST"/"$moduleName"/index.md
    echo "author: \"$moduleAuthor\"" >>"$DST"/"$moduleName"/index.md

    if [ -f "$moduleLogo" ]; then
      cp $moduleLogo "$DST"/"$moduleName"
      echo "logo: \"./logo.png\"" >>"$DST"/"$moduleName"/index.md
    elif [ -f "$modulecover" ]; then
      cp $modulecover "$DST"/"$moduleName"
      echo "cover: \"./cover.png\"" >>"$DST"/"$moduleName"/index.md
    else
      echo "No logo or cover image"
    fi
    echo "---" >>"$DST"/"$moduleName"/index.md

    if [ -f "$modulereadme" ]; then
      cat $modulereadme >>"$DST"/"$moduleName"/index.md
    else
      echo "No info available about this module" >>"$DST"/"$moduleName"/index.md
    fi

  fi

done
