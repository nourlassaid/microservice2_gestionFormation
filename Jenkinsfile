pipeline {
    agent any

    environment {
        NODEJS_HOME = tool name: 'NODEJS', type: 'jenkins.plugins.nodejs.tools.NodeJSInstallation'
        PATH = "${env.NODEJS_HOME}/bin:${env.PATH}"
        CHROME_BIN = '/usr/bin/google-chrome' // Chemin vers le binaire Chrome
        DOCKER_HUB_REGISTRY = 'docker.io' // URL du registre Docker Hub
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

        /*stage('Fix Permissions') {
            steps {
                // Fixer les permissions pour le répertoire du projet et les node_modules
                sh 'chmod -R 777 .'
            }
        }*/

        /*stage('Build') {
            steps {
                // sh 'node app.js'
                sh 'npm run build'
            }
        }*/

        /*stage('Build Docker image') {
            steps {
                sh 'docker build -t micr_o2:latest -f Dockerfile .'
                // Taguer l'image Docker avec une version
                sh 'docker tag micr_o2:latest nour0/micr_o2:latest'
            }
        }*/

        /*stage('Deploy Docker image') {
            steps {
                script {
                    // Pousser l'image Docker vers Docker Hub
                    withCredentials([usernamePassword(credentialsId: 'nourlassaid-token', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        docker.withRegistry('https://index.docker.io/v1/', '12') {
                            // Pousser à la fois les images latest et taggées
                            docker.image('nour0/micr_o2:latest').push('latest')
                        }
                    }
                }
            }
        }*/
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
