#!/bin/sh

INDEXDIR="../meta-data/"
FILE="./module.txt"

if [ -f "$FILE" ]; then
    echo "$FILE exists."
    moduleName=$(cat "$FILE"|jq '.["id"]' |sed -e 's/^"//' -e 's/"$//')
    echo $moduleName
    moduleDir=$(mkdir "$INDEXDIR""$moduleName")
    echo "scraping data from $moduleName"
    
    moduleDes=$(touch "$INDEXDIR""$moduleName"/module.txt)
     
    echo "searching for readme file"


    for F in *;
    do 
    if [ $F == *.MD ]; then 
      echo "Readme Found"
    sudo touch "$INDEXDIR""$moduleName"/README.md
       readmedest="$INDEXDIR""$moduleName"/README.md
        chmod -rwx "$readmedest"
        echo "$readmedest"
        sudo cat $F >> $readmedest
        
    elif [ $F == *.md ]; then
        echo "Readme Found"
       sudo touch "$INDEXDIR""$moduleName"/README.md
        readmedest="$INDEXDIR""$moduleName"/README.md
        chmod -rwx "$readmedest"
        echo "$readmedest"
        sudo cat $F >> $readmedest
        
    elif [ $F == *.markdown ]; then
       echo "Readme Found"
     sudo touch "$INDEXDIR""$moduleName"/README.md
       readmedest="$INDEXDIR""$moduleName"/README.md
        chmod -rwx "$readmedest"
        echo "$readmedest"
        sudo cat $F >> $readmedest
        
    else 
      echo "No Readme file Found"
    fi 
    done 
   
    logoSrc="./logo.png"
    coverSrc="./cover.png"

    if [ -f "$logoSrc" ]; then
     
        logodst="$INDEXDIR""$moduleName"
        sudo cp $logoSrc $logodst
        
    elif [ -f "$coverSrc" ]; then
     
        coverdst="$INDEXDIR""$moduleName"
        sudo cp  $coverSrc $coverdst

    else
       echo "LOGO or COVER image not found"
    fi

     
else

  echo "The repository is not module"


fi