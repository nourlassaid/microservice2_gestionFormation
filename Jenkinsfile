pipeline {
    agent any

    environment {
        DOCKER_PATH = "C:\\Program Files\\Docker\\cli-plugins"
        PATH = "${DOCKER_PATH};${PATH}"
        NODEJS_PATH = "C:\\Program Files\\nodejs"
    }

    stages {
        // Your other stages here...

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    withCredentials([kubernetesServiceAccount(credentialsId: '13', caCertificate: '', namespace: 'formation')]) {
                        // Apply Kubernetes manifests for deployment and service
                        bat 'kubectl apply -f formation-deployment.yaml'
                        bat 'kubectl apply -f formation-service.yaml'
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
