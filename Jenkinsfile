pipeline {
    agent any

    environment {
        NODEJS_HOME = tool name: 'NodeJS', type: 'jenkins.plugins.nodejs.tools.NodeJSInstallation'
        PATH = "${env.NODEJS_HOME}\\bin;${env.PATH}"
        DOCKER_HUB_REGISTRY = 'docker.io' // Docker Hub registry URL
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
            }
        }

        stage('Fix Permissions') {
            steps {
                // Fix permissions for the project directory and node_modules (Windows specific command)
                bat 'icacls . /grant Everyone:(F) /T'
            }
        }

        stage('Build') {
            steps {
                bat 'npm run build'
            }
        }

        stage('Build Docker image') {
            steps {
                script {
                    // Change directory to the location of the Dockerfile
                    dir('path/to/dockerfile') {
                        // Build Docker image
                        bat 'docker build -t micro3_formations-app:latest .'
                        // Tag the Docker image with a version
                        bat 'docker tag micro3_formations-app:latest nour0/micro3_formations-app:latest'
                    }
                }
            }
        }

        stage('Deploy Docker image') {
            steps {
                script {
                    // Push Docker image to Docker Hub
                    withCredentials([string(credentialsId: 'docker_hub_credentials', variable: 'DOCKER_TOKEN')]) {
                        docker.withRegistry('https://index.docker.io/v1/', 'docker_hub_credentials') {
                            // Push both the latest and tagged images
                            docker.image('nour0/micro3_formations-app:latest').push('latest')
                        }
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Build succeeded!'
            // Add any success post-build actions here
        }

        failure {
            echo 'Build failed!'
            // Add any failure post-build actions here
        }
    }
}
