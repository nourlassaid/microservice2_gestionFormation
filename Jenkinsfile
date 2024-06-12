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
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    deleteDir()
                    sh 'npm install'
                }
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }

        stage('Test') {
            parallel {
                stage('Unit Tests') {
                    steps {
                        sh 'npm test'
                    }
                }
                stage('End-to-End Tests') {
                    steps {
                        sh 'npm run test:e2e'
                    }
                }
            }
        }

        stage('SonarQube Scan') {
            steps {
                script {
                    def scannerHome = tool name: 'Sonar', type: 'hudson.plugins.sonar.SonarRunnerInstallation'
                    withSonarQubeEnv('Sonar') {
                        sh "${scannerHome}/bin/sonar-scanner -Dsonar.login=${SONAR_USER} -Dsonar.password=${SONAR_PASS}"
                    }
                }
            }
        }
    }
    }

    post {
        always {
            node {
                junit 'reports/**/*.xml'
            }
            cleanWs()
        }
    }

