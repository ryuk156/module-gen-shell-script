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
	         cd ./module-site/ModuleSite
	         git config --global user.email "yp15601560@gmail.com"
             git config --global user.name "ryuk156"
             git checkout -b module_gen
             git add .              
	         git commit -m "push all modules"
             git push https://${GIT_CREDS_USR}:${GIT_CREDS_PSW}@github.com/${GIT_CREDS_USR}/ModuleSite.git module_gen -f   
             git request-pull https://github.com/MovingBlocks/ModuleSite.git master:module_gen
            '''
                
            }
        }
    }
}
