pipeline {
    agent any

    environment {
        IMAGE_NAME = "text2image"
        IMAGE_TAG = "${env.BUILD_NUMBER}"
    }

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                bat "docker build -t %IMAGE_NAME%:%IMAGE_TAG% ."
            }
        }

        stage('Run Docker Container') {
            steps {
                bat "docker run --rm %IMAGE_NAME%:%IMAGE_TAG%"
            }
        }

        stage('Clean Up') {
            steps {
                bat "docker container prune -f"
                bat "docker image prune -f"
            }
        }
    }

    post {
        success {
            echo "✅ Pipeline completed successfully!"
        }
        failure {
            echo "❌ Pipeline failed!"
        }
    }
}
