pipeline {
    agent any

    environment {
        DOCKER_PATH = "C:\\Program Files\\Docker\\cli-plugins"
        NODEJS_PATH = "C:\\Program Files\\nodejs"
        PATH = "${DOCKER_PATH};${NODEJS_PATH};${env.PATH}"  // Ajout de Docker et Node.js au PATH
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
                    bat 'npm install @mapbox/node-pre-gyp'
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
                    withSonarQubeEnv('SonarQube Test') {
                        bat 'npm run sonarqube'
                    }
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    bat 'docker build -t nour0/formationfrontend:latest .'
                }
            }
        }

         stage('kubernetes Deployment') {
            steps {
                script {
                   bat 'kubectl apply -f formation-deployment.yaml' 
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
