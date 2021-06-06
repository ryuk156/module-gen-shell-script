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
           sh "bash ./loadrepo.sh"
           sh "mkdir meta-data"
           sh "mkdir cloned-repo"
           sh "cd meta-data"
           sh "pwd"
           }
        }

    }
}