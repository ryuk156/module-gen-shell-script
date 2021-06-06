pipeline{
    agent any
    stages{
        stage('init'){
            steps{
              echo "start the process"
            }            
        }
        stage('gather data'){
            steps{
           echo "gather all data"
            }    
        }
        stage('generate frontmatter'){
           steps{
           sh '''
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

              
           
            '''
           sh "mkdir meta-data"
           sh "mkdir cloned-repo"
           sh "cd meta-data"
           sh "pwd"
           }
        }

    }
}