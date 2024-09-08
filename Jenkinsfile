pipeline {
    agent any
    stages {
        stage("Checkout") {
            steps {
                git branch: 'main', url: 'https://github.com/amitmaurya07/CI-CD_Oriserve.git'
            }
        }

        stage("Build") {
            steps {
                script {
                    sh 'docker build -t web-application:1 .'
                }
            }
        }

        stage("Push") {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'Docker_Passs', usernameVariable: 'Docker_Username')]) {
                        sh 'docker login -u amaurya07 -p ${Docker_Passs}'
                        sh 'docker tag web-application:1 amaurya07/web-application:1'
                        sh 'docker push amaurya07/web-application:1'
                    }
                }
            }
        }

        stage("Deploy to Kubernetes Cluster"){
            steps{
                script {
                    withKubeConfig(caCertificate: '', clusterName: 'minikube', contextName: '', credentialsId: 'k8s-secret', namespace: 'deploy', restrictKubeConfigAccess: false, serverUrl: ' https://192.168.76.2:8443') {
                            sh 'kubectl get nodes'
                    }
                }
            }
        }
    }
}
