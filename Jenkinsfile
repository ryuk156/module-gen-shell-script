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
    }
}
