pipeline {
    agent any

    environment {
        NODEJS_HOME = tool name: 'NodeJS 14', type: 'NodeJSInstallation'
        PATH = "${NODEJS_HOME}/bin:${env.PATH}"
    }

    stages {
        stage('Install Dependencies') {
            steps {
                script {
                    // Clean workspace before starting
                    deleteDir()
                }
                // Install npm dependencies
                sh 'npm install'
            }
        }

        stage('Build') {
            steps {
                // Run the build script
                sh 'npm run build'
            }
        }

        stage('Test') {
            parallel {
                stage('Unit Tests') {
                    steps {
                        // Run unit tests
                        sh 'npm test'
                    }
                }
                stage('End-to-End Tests') {
                    steps {
                        // Run end-to-end tests
                        sh 'npm run test:e2e'
                    }
                }
            }
        }

        stage('Code Analysis') {
            steps {
                // Run SonarQube scanner
                withSonarQubeEnv('SonarQube') {
                    sh 'sonar-scanner'
                }
            }
        }
    }

    post {
        always {
            // Archive test results
            junit 'reports/**/*.xml'

            // Clean up workspace after build
            cleanWs()
        }
    }
}
