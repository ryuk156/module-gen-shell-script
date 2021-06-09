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
		       GIT_CREDS = credentials('GIT')
		    }
            steps {

        
           
            sh 'bash ./loadmodules.sh'
            sh '''

             baseRepo="master"
             headRepo="module_gen"
             prTitle="add: Generated Modules"
             prDesc="This Pr generate the modules from terasology  org and  generates modules ifo"
             data=$(cat <<-END
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
             if git diff-index --quiet HEAD --; then
              echo "Nothing to psuh"
             else
             git push https://${GIT_CREDS_USR}:${GIT_CREDS_PSW}@github.com/${GIT_CREDS_USR}/ModuleSite.git module_gen -f   
             curl -i -H "Authorization: token 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" -X POST "https://api.github.com/repos/ryuk156/ModuleSite/pulls" -d "$data" 
            fi
            '''
            
            }
        }
    }
}
