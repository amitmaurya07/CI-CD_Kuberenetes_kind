pipeline{
    agent any 
    stages{
        stage("Checkout"){
            steps{
                git branch: 'main', url: 'https://github.com/amitmaurya07/CI-CD_Oriserve.git'
        }
        stage("Build"){
            steps{
                script {
                    docker build -t web-application:1 .
                }
        }    }
    }
}
}
}