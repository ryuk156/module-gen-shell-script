pipeline {
    agent any
    stages {
        stage('init') {
            steps {
                echo 'start the process'
               
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
             
            '''
            sh'bash ./openpr.sh'
            
            }
        }
    }
}
