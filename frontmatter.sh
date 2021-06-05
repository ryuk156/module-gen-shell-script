#!/bin/bash

DIR="../meta-data"
DST="../modules"

mkdir "$DST"

for i in $(ls -d  ../meta-data/* ); do 

  moduleFile="$i"/module.txt
 if [ -f "$moduleFile" ]; then
  moduleName=$(cat "$moduleFile"| grep -oP '(?<="id": ")[^"]*' | head -n1  )
  moduleAuthor=$(cat "$moduleFile"| grep -oP '(?<="author": ")[^"]*' )
  moduleDisplayname=$(cat "$moduleFile"| grep -oP '(?<="displayName": ")[^"]*')
  moduleDescription=$(cat "$moduleFile"| grep -oP '(?<="description": ")[^"]*' )
  echo "$moduleDescription"
  moduleLogo="$i"/logo.png
  modulecover="$i"/cover.png
  modulereadme="$i"/README.md
  
  mkdir "$DST"/"$moduleName"
  touch "$DST"/"$moduleName"/index.md
   echo "---" > "$DST"/"$moduleName"/index.md
   echo "posttype:  \"module\"  " >> "$DST"/"$moduleName"/index.md
   echo "title: \"$moduleDisplayname\"" >> "$DST"/"$moduleName"/index.md
   
   if [ -f "$moduleLogo" ]; then
     cp $moduleLogo "$DST"/"$moduleName"
    echo "logo: \"./logo.png\"" >> "$DST"/"$moduleName"/index.md
    elif [ -f "$modulecover" ]; then
    cp $modulecover "$DST"/"$moduleName"
    echo "cover: \"./cover.png\"" >> "$DST"/"$moduleName"/index.md
    else
         echo "no logo or cover"
    fi

     echo "---" >> "$DST"/"$moduleName"/index.md

    if [ -f "$modulereadme" ]; then 
      cat  $modulereadme >> "$DST"/"$moduleName"/index.md
      else 
      echo "no info available"
      fi


#   echo "$moduleName"
#   echo "$moduleAuthor"
#   echo "$moduleDescription"
  fi
done


