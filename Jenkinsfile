pipeline {
    agent any

    environment {
        NODEJS_HOME = tool name: 'NodeJS', type: 'jenkins.plugins.nodejs.tools.NodeJSInstallation'
        PATH = "${env.NODEJS_HOME}/bin:${env.PATH}"
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

    stage('Code Analysis') {
            environment {
                scannerHome = tool 'Sonar'
            }
            steps {
                script {
                    withSonarQubeEnv('Sonar') {
                        sh "${scannerHome}/bin/sonar-scanner \
                            -Dsonar.projectKey=<project-key> \
                            -Dsonar.projectName=<project-name> \
                            -Dsonar.projectVersion=<project-version> \
                            -Dsonar.sources=<project-path>"
                    }
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
                    withCredentials([string(credentialsId: 'docker-hub-token', variable: 'DOCKER_TOKEN')]) {
                        docker.withRegistry('https://index.docker.io/v1/', 'docker') {
                            bat "docker push nour0/formationfrontend:latest"
                        }
                    }
                }
            }
        }

        stage('Kubernetes Deployment') {
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
