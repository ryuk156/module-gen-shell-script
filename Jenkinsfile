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


             pull_request() {
  to_branch=$1
  if [ -z $to_branch ]; then
    to_branch="master"
  fi
  
  # try the upstream branch if possible, otherwise origin will do
  upstream=$(git config --get remote.upstream.url)
  origin=$(git config --get remote.origin.url)
  if [ -z $upstream ]; then
    upstream=$origin
  fi
  
  to_user=$(echo $upstream | sed -e 's/.*[\/:]\([^/]*\)\/[^/]*$/\1/')
  from_user=$(echo $origin | sed -e 's/.*[\/:]\([^/]*\)\/[^/]*$/\1/')
  repo=$(basename `git rev-parse --show-toplevel`)
  from_branch=$(git rev-parse --abbrev-ref HEAD)
  open "https://github.com/$to_user/$repo/pull/new/$to_user:$to_branch...$from_user:$from_branch"
}

              

	         cd ./module-site/ModuleSite
	         git config --global user.email "yp15601560@gmail.com"
git config --global user.name "ryuk156"
git checkout -b module_gen
git add .              
git commit -m "push all modules"
git push https://${GIT_CREDS_USR}:${GIT_CREDS_PSW}@github.com/${GIT_CREDS_USR}/ModuleSite.git module_gen -f   
pull_request
              

            '''
                
            }
        }
    }
}
