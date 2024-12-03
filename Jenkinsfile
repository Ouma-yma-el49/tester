node{
    def  mvnHome= tool 'maven'
    def dockerImage
    def dockerImageTag = "example${env.BUILD_NUMBER}"
    
        stage('Clone Repo') {
            steps {
                // Récupérer le code depuis le dépôt Git
                git 'https://github.com/Ouma-yma-el49/tester.git'
            }
        }

        stage('Build Project'){
            sh "'${mvnHome}/bin/mvn' -B -DskipTests clean package"
        }

        stage('Initialize Docker'){         
            def dockerHome = tool 'MyDocker'         
            env.PATH = "${dockerHome}/bin:${env.PATH}"     
            }

        stage('Build Docker Image') {
              sh "docker -H tcp://192.168.8.100:2375 build -t devopsexample:${env.BUILD_NUMBER} ."
        }
         

        stage('Deploy Docker Image'){
                echo "Docker Image Tag Name: ${dockerImageTag}"
            sh "docker -H tcp://192.168.8.100:2375 run --name devopsexample -d -p 2222:2222 devopsexample:${env.BUILD_NUMBER}"
            }
}
