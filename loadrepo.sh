#!/bin/bash

touch allmodules.txt

for i in {1..3}; do

        getRepos=$(curl -s "https://api.github.com/orgs/terasology/repos?q=&per_page=100&sort=name&page=$i")
        parseData=$(echo "$getRepos" | grep -oP '(?<="full_name": "Terasology/)[^"]*')
        if [ -s allmodules.txt ]; then
                echo "$parseData" >>allmodules.txt
        else
                echo "$parseData" >allmodules.txt
        fi
done

readarray allrepos < allmodules.txt

for row in "${allrepos[@]}"; do
        echo "${row}" | grep -v "^$" 
done

mkdir meta-data
mkdir clonedrepos

cd clonedrepos

for value in "${allrepos[@]}"; do
        cleanvalue=$(echo "${value}" | grep -v "^$")
        git clone "https://github.com/Terasology/${cleanvalue}"
        cd "${value}"
        ../../scrape.sh
        cd ..
done
