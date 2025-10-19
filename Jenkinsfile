pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')  // your Jenkins credential ID
        DOCKER_IMAGE = "rishithaballem/text-to-image"     // your Docker Hub repo name
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    bat "docker build -t %DOCKER_IMAGE% ."
                }
            }
        }

        stage('Login to DockerHub') {
            steps {
                script {
                    bat "echo %DOCKERHUB_CREDENTIALS_PSW% | docker login -u %DOCKERHUB_CREDENTIALS_USR% --password-stdin"
                }
            }
        }

        stage('Push Image') {
            steps {
                script {
                    bat "docker push %DOCKER_IMAGE%"
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed — cleaning up!'
        }
    }
}
