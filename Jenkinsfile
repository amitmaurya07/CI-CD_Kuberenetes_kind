pipeline{
    agent any 
    stages{
        stage("Checkout"){
            steps{
                git branch: 'main', url: 'https://github.com/amitmaurya07/CI-CD_Oriserve.git'
        }
        stage("Build"){
            steps{
                docker build -t amitmau07/we-application:1
        }
    }
}
}