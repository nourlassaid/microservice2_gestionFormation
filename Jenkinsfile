pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = 'formation/micro'
    }
    
    stages {
        stage('Build') {
            steps {
                script {
                    // Étape de construction de l'image Docker
                    docker.build DOCKER_IMAGE
                }
            }
        }
        
        stage('Test') {
            steps {
                // Ajoutez ici les étapes de test de votre application Node.js
                // Par exemple : npm test
            }
        }
        
        stage('Deploy') {
            steps {
                // Étape de déploiement de l'image Docker
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                        docker.image(DOCKER_IMAGE).push('latest')
                    }
                }
            }
        }
    }
    
    post {
        always {
            // Nettoyage des ressources après l'exécution du pipeline
            cleanWs()
        }
    }
}
