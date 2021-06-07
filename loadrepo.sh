#!/bin/bash

touch allmodules.txt

for i in {1..2}; do
        getRepos=$(curl -s "https://api.github.com/orgs/terasology/repos?q=&per_page=1&sort=name&page=$i")
        parseData=$(echo "$getRepos" | grep -oP '(?<="full_name": "Terasology/)[^"]*')
        if [ -s allmodules.txt ]; then
                echo "$parseData" >>allmodules.txt
        else
                echo "$parseData" >allmodules.txt
        fi
done

readarray allrepos < allmodules.txt

# for row in "${allrepos[@]}"; do
#         echo "${row}" | grep -v "^$" 
# done

mkdir meta-data
mkdir clonedrepos

cd clonedrepos

for value in "${allrepos[@]}"; do
        # cleanvalue=$(echo "${value}" | grep -v "^$")
        # echo "${cleanvalue}"
        git clone "https://github.com/Terasology/${value//$'\n'/}"
        cd "${value//$'\n'/}"
        ../../scrape.sh
        cd ..
done
