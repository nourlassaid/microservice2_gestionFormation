pipeline {
    agent any

    environment {
        NODEJS_HOME = tool name: 'NODEJS', type: 'jenkins.plugins.nodejs.tools.NodeJSInstallation'
        PATH = "${env.NODEJS_HOME}/bin:${env.PATH}"
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

        stage('Build Docker image') {
            steps {
                script {
                    // Construire l'image Docker
                    sh 'docker build -t micr_o2:latest -f Dockerfile .'
                }
            }
        }

        stage('Deploy Docker image') {
            steps {
                script {
                    // Pousser l'image Docker vers Docker Hub ou un autre registre de conteneurs
                    sh 'docker push micr_o2:latest'
                }
            }
        }
    }

    post {
        success {
            echo 'Build succeeded!'
            // Ajouter ici toutes les actions post-build en cas de succès
        }

        failure {
            echo 'Build failed!'
            // Ajouter ici toutes les actions post-build en cas d'échec
        }
    }
}
