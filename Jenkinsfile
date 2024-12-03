pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                // Récupérer le code depuis le dépôt Git
                git branch: 'Main', url: 'https://github.com/Ouma-yma-el49/tester.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Construire une image Docker pour le projet HTML
                script {
                    dockerImage = docker.build("tp1:${env.BUILD_ID}")
                }
            }
        }

        stage('Run Tests') {
            steps {
                // Vérifier si le fichier HTML est accessible
                script {
                    dockerImage.inside('-p 8080:80') {
                        sh 'curl -f http://localhost:80 || exit 1'
                    }
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                
                        dockerImage.push("${env.BUILD_ID}")
                        dockerImage.push("latest")
                    }
                }
            }
        }

