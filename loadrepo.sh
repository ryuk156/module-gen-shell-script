#!/bin/bash

allRepos=()

for i in {1..3}; do
    getRepos=$(curl -s "https://api.github.com/orgs/terasology/repos?q=&per_page=100&sort=name&page=$i")
    parseData=$(echo "$getRepos" | grep -oP '(?<="name": ")[^"]*')
    allRepos+=$parseData
done

for value in "${allRepos[@]}"; do
    echo "$value"
done
