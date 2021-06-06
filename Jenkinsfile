pipeline{
    agent any
    stages{
        stage('init'){
            echo "start the process"
        }
        stage('gather data'){
             echo "gather all data"
        }
        stage('generate frontmatter'){
           sh "bash ./loadrepo.sh"
           sh "mkdir meta-data"
           sh "mkdir cloned-repo"
           sh "cd meta-data"
           sh "pwd"
        }

    }
}