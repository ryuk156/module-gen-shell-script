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
        echo "$row"
done

mkdir meta-data
mkdir clonedrepos

cd clonedrepos

for value in "${allrepos[@]}"; do

        git clone "https://github.com/Terasology/${value}"
        cd "${value}"
        ../../scrape.sh
        cd ..
done
