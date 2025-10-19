pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
        IMAGE_NAME = 'rishitha-ballem/jenkins-demo-app'
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Rishitha-Ballem/jenkins-demo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $IMAGE_NAME .'
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub',
                        usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                        
                        sh 'echo $PASSWORD | docker login -u $USERNAME --password-stdin'
                        sh 'docker push $IMAGE_NAME'
                    }
                }
            }
        }
    }

    post {
        always {
            sh 'docker logout'
        }
    }
}
