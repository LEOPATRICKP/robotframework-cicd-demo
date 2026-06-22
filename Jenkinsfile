pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git 'https://github.com/<username>/robotframework-cicd-demo.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                bat 'pip install -r requirements.txt'
            }
        }

        stage('Run Robot Tests') {
            steps {
                bat 'robot Tests/'
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: '*.html'
        }
    }
}