pipeline {
    agent any

    environment {
        DOCKER_PATH = "C:\\Program Files\\Docker\\cli-plugins"
        PATH = "${DOCKER_PATH};${PATH}"  // Utilisation de ';' pour Windows
        NODEJS_PATH = "C:\\Program Files\\nodejs"  // Chemin correct pour Node.js
        KUBECONFIG = "C:\\Program Files\\Jenkins\\.kube\\config"
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
                    bat 'npm install @mapbox/node-pre-gyp'
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

        stage('Build Docker Image') {
            steps {
                script {
                    bat 'docker build -t nour0/formationfrontend:latest .'
                }
            }
        }

        stage('Deploy with kubectl') {
            steps {
                script {
                    // Exemple d'utilisation d'un fichier kubeconfig sécurisé
                    withCredentials([file(credentialsId: 'kubeconfig', variable: 'KUBECONFIG')]) {
                        bat '''
                        kubectl --kubeconfig="${KUBECONFIG}" get namespace formation || kubectl --kubeconfig="${KUBECONFIG}" create namespace formation
                        kubectl --kubeconfig="${KUBECONFIG}" apply -f db/configMap.yaml -n formation
                        kubectl --kubeconfig="${KUBECONFIG}" apply -f db/mysql-deployment.yaml -n formation
                        kubectl --kubeconfig="${KUBECONFIG}" apply -f db/mysql-service.yaml -n formation
                        kubectl --kubeconfig="${KUBECONFIG}" apply -f db/persistant.yml -n formation
                        kubectl --kubeconfig="${KUBECONFIG}" apply -f formation-deployment.yaml -n formation
                        kubectl --kubeconfig="${KUBECONFIG}" apply -f formation-service.yaml -n formation
                        '''
                    }
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
