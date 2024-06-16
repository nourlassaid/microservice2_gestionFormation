pipeline {
    agent any

    environment {
        DOCKER_PATH = "C:\\Programmes\\Docker\\cli-plugins"
        PATH = "${DOCKER_PATH}:${PATH}"
       
        NODEJS_PATH = "C:\\ProgramData\\Microsoft\\Windows\\Start Menu\\Programs\\Node.js"
        SONAR_SCANNER_HOME = "C:\\Users\\MSAR\\Desktop\\sonar-scanner-5.0.1.3006-windows"
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    checkout scm
                }
            }
        }
        stage('Install Dependencies and Run Tests') {
            steps {
                script {
                    bat 'npm install'
                    //bat 'npm test --detectOpenHandles'
                }
            }
        }
        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('sonarquabe') {
                    bat '"C:\\Users\\MSAR\\Desktop\\sonar-scanner-5.0.1.3006-windows\\bin\\sonar-scanner" -Dsonar.projectKey=PLANIFICATION-SERVICE'
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Construire l'image Docker avec élévation de privilèges
                    bat 'docker build -t nourhene112/planification-serv:latest .'
                }
            }
        }
        stage('Tag Docker Image') {
            steps {
                script {
                    bat "docker tag planification-serv nourhene112/planification-serv:latest"
                }
            }
        }
        stage('Publish Docker Image') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                        bat 'docker login'
                        bat 'docker push nourhene112/planification-serv:latest'
                    }
                }
            }
        }
    }
}
