#!/bin/sh

INDEXDIR="../meta-data/"
FILE="./module.txt"

if [ -f "$FILE" ]; then
    echo "$FILE exists."
    moduleName=$(cat "$FILE"|jq '.["id"]' |sed -e 's/^"//' -e 's/"$//')
    echo $moduleName
    moduleDir=$(mkdir "$INDEXDIR""$moduleName")
    echo "scraping data from $moduleName"
    
    sudo touch "$INDEXDIR""$moduleName"/module.txt
    moduleDes="$INDEXDIR""$moduleName"/module.txt
    chmod 777 "$moduleDes"
     sudo cat $FILE >> $moduleDes
     
    echo "searching for readme file"


    for F in *;
    do 
    if [ $F == *.MD ]; then 
      echo "Readme Found"
    sudo touch "$INDEXDIR""$moduleName"/README.md
       readmedst="$INDEXDIR""$moduleName"/README.md
        chmod 777 "$readmedst"
        echo "$readmedst"
        sudo cat $F >> $readmedst
        
    elif [ $F == *.md ]; then
        echo "Readme Found"
       sudo touch "$INDEXDIR""$moduleName"/README.md
        readmedst="$INDEXDIR""$moduleName"/README.md
        chmod 777 "$readmedst"
        echo "$readmedst"
        sudo cat $F >> $readmedst
        
    elif [ $F == *.markdown ]; then
       echo "Readme Found"
     sudo touch "$INDEXDIR""$moduleName"/README.md
       readmedst="$INDEXDIR""$moduleName"/README.md
        chmod 777 "$readmedst"
        echo "$readmedst"
        sudo cat $F >> $readmedst
    fi 
    done 
   
    logoSrc="./logo.png"
    coverSrc="./cover.png"

    if [ -f "$logoSrc" ]; then
     
        logodst="$INDEXDIR""$moduleName"
        sudo cp $logoSrc $logodst
        echo "Logo Image copy done"
        
    elif [ -f "$coverSrc" ]; then
     
        coverdst="$INDEXDIR""$moduleName"
        sudo cp  $coverSrc $coverdst

        echo "Cover Image copy done"

    else
       echo "LOGO or COVER image not found"
    fi

     
else

  echo "The repository is not module"


fi