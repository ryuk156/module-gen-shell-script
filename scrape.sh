#!/bin/bash


INDEXDIR="../../meta-data/"
FILE="./module.txt"

if [ -f "$FILE" ]; then
  echo "$FILE exists."
  moduleName=$(cat "$FILE"  | grep -Po '"id" *\K: *\K"[^"]*"' | sed 's/"//g'| head -n1)
  echo $moduleName
  mkdir "$INDEXDIR""$moduleName"
  echo "scraping data from $moduleName"

  touch "$INDEXDIR""$moduleName"/module.txt
  moduleDes="$INDEXDIR""$moduleName"/module.txt
  cat $FILE >"$moduleDes"
  echo "searching for readme file"

  for F in *; do
    if [ $F == *.MD ]; then
      echo "Readme Found"
      touch "$INDEXDIR""$moduleName"/README.md
      readmedst="$INDEXDIR""$moduleName"/README.md
      echo "$readmedst"
      cat $F >"$readmedst"

    elif [ $F == *.md ]; then
      echo "Readme Found"
      touch "$INDEXDIR""$moduleName"/README.md
      readmedst="$INDEXDIR""$moduleName"/README.md

      echo "$readmedst"
      cat $F >"$readmedst"

    elif [ $F == *.markdown ]; then
      echo "Readme Found"
      touch "$INDEXDIR""$moduleName"/README.md
      readmedst="$INDEXDIR""$moduleName"/README.md
      echo "$readmedst"
      cat $F >"$readmedst"
    fi
  done

  logoSrc="./logo.png"
  coverSrc="./cover.png"

  if [ -f "$logoSrc" ]; then
    logodst="$INDEXDIR""$moduleName"
    cp $logoSrc $logodst
    echo "Logo Image copy done"

  elif [ -f "$coverSrc" ]; then
    coverdst="$INDEXDIR""$moduleName"
    cp $coverSrc $coverdst
    echo "Cover Image copy done"
    
  else
    echo "LOGO or COVER image not found"
  fi

else
  echo "The repository is not module"

fi
