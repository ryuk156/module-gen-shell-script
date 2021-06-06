#!/bin/bash

allRepos=()

fetch(){
    for i in {1..3}; do
    getRepos=$(curl -s "https://api.github.com/orgs/terasology/repos?q=&per_page=100&sort=name&page=$i")
    parseData=$(echo "$getRepos" | grep -oP '(?<="name": ")[^"]*')
    allRepos+=$parseData
    done

    return $allRepos
   
}

fetch

for value in "${allRepos[@]}"; do
    echo "$value"
done
