pipeline {
    agent any
    
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials')
        SONARQUBE_ENV = 'SonarQube Test'
    }
    
    stages {
        stage('Checkout SCM') {
            steps {
                git url: 'https://github.com/nourlassaid/microservice2_gestionFormation.git', branch: 'main', credentialsId: 'nourlassaid-token'
            }
        }
        
        stage('Install dependencies') {
            steps {
                bat 'npm install'
                bat 'npm install @mapbox/node-pre-gyp'
            }
        }
        
        stage('SonarQube Analysis') {
            environment {
                scannerHome = tool 'SonarQube Scanner'
            }
            steps {
                withSonarQubeEnv('SonarQube Test') {
                    bat "${scannerHome}/bin/sonar-scanner"
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
                withCredentials([string(credentialsId: 'DOCKERHUB_TOKEN', variable: 'DOCKERHUB_TOKEN')]) {
                    bat 'docker login -u nour0 -p %DOCKERHUB_TOKEN%'
                    bat 'docker push nour0/formationfrontend:latest'
                }
            }
        }
        
        stage('Kubernetes Deployment') {
            steps {
                script {
                    def k8s = "formation-deployment.yaml"
                    bat "kubectl apply -f ${k8s}"
                }
            }
        }
    }
}
