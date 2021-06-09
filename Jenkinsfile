pipeline {
    agent any
    stages {
        stage('init') {
            steps {
                echo 'start the process'
               cleanWs()
            }
        }
        stage('gather data') {
            steps {
                script {
                    sh 'bash ./loadrepo.sh'
                }
            }
        }
        stage('generate frontmatter') {
            steps {
                sh 'bash ./frontmatter.sh'
            }
        }
         stage('push data to module site') {
             environment{
		       GIT_CREDS = credentials('GIT_TOKEN')
		    }
            steps {

            sh 'bash ./loadmodules.sh'
            sh '''#!/bin/bash
             

            baseRepo="master"
            headRepo="module_gen"
            prTitle="add: Generated Modules"
            prDesc="This Pr generate the modules from terasology  org and  generates modules"
             data=$(
                cat <<-END
              {
                 "title": "$prTitle",
                  "base": "$baseRepo",
                  "head": "$headRepo",
                  "body": "$prDesc"
               }
              END
             )


	         cd ./module-site/ModuleSite
	         git config --global user.email "yp15601560@gmail.com"
             git config --global user.name "ryuk156" 
             git checkout -b module_gen
             git add .              
             git commit -m "push all modules"
             git push https://${GIT_CREDS}@github.com/ryuk156/ModuleSite.git  module_gen -f
             curl -i -H "Authorization: token $GIT_CREDS" -X POST "https://api.github.com/repos/ryuk156/ModuleSite/pulls" -d "$data"
            '''
           
            
            }
        }
    }
}
