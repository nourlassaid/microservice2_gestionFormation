pipeline {
    agent any

    environment {
        NODEJS_HOME = tool name: 'NodeJS', type: 'jenkins.plugins.nodejs.tools.NodeJSInstallation'
        PATH = "${env.NODEJS_HOME}/bin:${env.PATH}"
        CHROME_BIN = '/usr/bin/google-chrome'
        DOCKER_HUB_REGISTRY = 'docker.io'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install dependencies') {
            steps {
                bat 'npm install'
                bat 'npm install node-pre-gyp'
            }
        }

        stage('Build') {
            steps {
                bat 'npm run build'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('SonarQube Test') {
                    bat 'npm run sonarqube'
                }
            }
        }

        stage('Build Docker image') {
            steps {
                bat 'docker build --no-cache -t micro3_formations-app:latest -f Dockerfile .'
                bat 'docker tag micro3_formations-app:latest nour0/micro3_formations-app:latest'
            }
        }

        stage('Deploy Docker image') {
            steps {
                withCredentials([string(credentialsId: 'docker-hub-token', variable: 'DOCKER_TOKEN')]) {
                    bat "docker login -u nour0 -p ${DOCKER_TOKEN} ${DOCKER_HUB_REGISTRY}"
                    bat "docker push nour0/micro3_formations-app:latest"
                }
            }
        }

        stage('Kubernetes Deployment') {
            steps {
                bat 'kubectl apply -f formation-deployment.yaml'
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
