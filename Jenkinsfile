pipeline {
    agent any

    environment {
        NODEJS_HOME = "C:\\Program Files\\nodejs"
        DOCKER_PATH = "C:\\Program Files\\Docker\\cli-plugins"
        PATH = "${NODEJS_HOME};${DOCKER_PATH};${env.PATH}"
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    checkout scm
                }
            }
        }

        stage('Install dependencies') {
            steps {
                script {
                    bat 'npm install'
                    bat 'npm install node-pre-gyp'
                }
            }
        }

        stage('Build') {
            steps {
                bat 'npm run build'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                script {
                    // Assurez-vous que votre script SonarQube est correct
                    bat 'npm run sonarqube'
                }
            }
        }

        stage('Build Docker image') {
            steps {
                script {
                    bat 'docker build --no-cache -t formationfrontend:latest -f Dockerfile .'
                    bat 'docker tag formationfrontend:latest nour0/formationfrontend:latest'
                }
            }
        }

        stage('Deploy Docker image') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'nourlassaid', variable: 'DOCKER_TOKEN')]) {
                        bat "docker login -u <nour0> -p ${DOCKER_TOKEN}"
                        bat "docker push nour0/formationfrontend:latest"
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Build succeeded!'
        }

        failure {
            echo 'Build failed!'
        }
    }
}
