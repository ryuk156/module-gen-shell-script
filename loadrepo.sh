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

# for row in "${allrepos[@]}"; do
#         echo "${row}" | grep -v "^$" 
# done


mkdir clonedrepos

cd clonedrepos


for value in "${allrepos[@]}"; do
#        cd ../meta-data
#        mkdir ${value//$'\n'/}

#        cd ${value//$'\n'/}
#        touch module.txt
#        touch readme.txt
#        pwd
#        cd ..

        # cleanvalue=$(echo "${value}" | grep -v "^$")
        # echo "${cleanvalue}"
        git clone "https://github.com/Terasology/${value//$'\n'/}"
        cd "${value//$'\n'/}"
        cd ..
done


for d in * ; do
    cd $d
    ../../scrape.sh
    cd ..
done
