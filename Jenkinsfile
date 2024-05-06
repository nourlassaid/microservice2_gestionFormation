pipeline {
    agent any

    environment {
        NODEJS_HOME = tool name: 'NodeJS', type: 'jenkins.plugins.nodejs.tools.NodeJSInstallation'
        PATH = "${env.NODEJS_HOME}/bin:${env.PATH}"
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
                sh '${NODEJS_HOME}/bin/npm install'
            }
        }

        stage('Build') {
            steps {
                // Si nécessaire, effectuez des étapes de build ici
            }
        }

        stage('Build Docker image') {
            steps {
                sh 'docker build -t microservice-gestion-formations:latest .'
            }
        }

        stage('Push Docker image') {
            steps {
                script {
                    // Authentification auprès du registre Docker Hub
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                        sh "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD} ${DOCKER_HUB_REGISTRY}"
                    }
                    
                    // Poussez l'image Docker vers Docker Hub
                    sh 'docker push microservice-gestion-formations:latest'
                }
            }
        }
    }

    post {
        success {
            echo 'Build succeeded!'
            // Ajoutez ici toutes les actions post-build en cas de succès
        }

        failure {
            echo 'Build failed!'
            // Ajoutez ici toutes les actions post-build en cas d'échec
        }
    }
}
