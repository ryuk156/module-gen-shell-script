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

              function openpr() {
                  github_url=`git remote -v | awk '/fetch/{print $2}' | sed -Ee 's#(git@|git://)#https://#' -e 's@com:@com/@' -e 's%\.git$%%' | awk '/github/'`;
                 branch_name=`git symbolic-ref HEAD | cut -d"/" -f 3,4`;
                 pr_url=$github_url"/compare/master..."$branch_name
                open $pr_url;
                }

	         cd ./module-site/ModuleSite
	         git config --global user.email "yp15601560@gmail.com"
             git config --global user.name "ryuk156"
             git checkout -b module_gen
             git add .              
	         git commit -m "push all modules"
             git push https://${GIT_CREDS_USR}:${GIT_CREDS_PSW}@github.com/${GIT_CREDS_USR}/ModuleSite.git module_gen -f   
              
              if [ $? -eq 0 ]; then
                  openpr
             else
               echo 'failed to push commits and open a pull request.';
             fi

            '''
                
            }
        }
    }
}
