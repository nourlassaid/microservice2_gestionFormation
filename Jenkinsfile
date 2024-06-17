pipeline {
    agent any

    environment {
        DOCKER_PATH = "C:\\Program Files\\Docker\\cli-plugins"
        PATH = "${DOCKER_PATH};${PATH}"  // Utilisez ';' pour Windows
        NODEJS_PATH = "C:\\Program Files\\nodejs"  // Path Node.js correct
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
                    withSonarQubeEnv('SonarQube Test') {
                        bat 'npm run sonarqube'
                    }
                }
            }
        }

      stage('Build Docker image') {
    steps {
        script {
            // Build and tag Docker image
            docker.build('formationfrontend:latest', '-f Dockerfile .')
            docker.image('formationfrontend:latest').tag('nour0/formationfrontend', 'latest')
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
