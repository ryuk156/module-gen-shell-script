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
               script{
            sh "bash ./loadrepo.sh"
               }
           
        }

    }
}
}