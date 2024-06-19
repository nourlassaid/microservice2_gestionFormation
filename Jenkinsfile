pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-token')
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
                bat 'npm install @mapbox/node-pre-gyp'
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
        stage('Build Docker Image') {
            steps {
                bat 'docker build -t nour0/formationfrontend:latest .'
            }
        }
        stage('Deploy Docker image') {
            steps {
                withCredentials([string(credentialsId: 'dockerhub-token', variable: 'DOCKERHUB_TOKEN')]) {
                    bat 'docker login -u nour0 -p %DOCKERHUB_TOKEN%'
                    bat 'docker push nour0/formationfrontend:latest'
                }
            }
        }

       stage('Kubernetes Deployment') {
    steps {
        script {
            bat 'kubectl version'
            bat 'kubectl config view'
            bat 'kubectl get pods --all-namespaces'
            bat 'kubectl apply -f formation-deployment.yaml'
            bat 'kubectl apply -f formation-service.yaml'
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
