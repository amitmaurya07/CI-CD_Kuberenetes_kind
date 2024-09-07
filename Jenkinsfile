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

        stage("Deploy to Kubernetes cluster") {
            steps {
                kubeconfig(caCertificate: '''-----BEGIN CERTIFICATE-----
                MIIDBjCCAe6gAwIBAgIBATANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQDEwptaW5p
                a3ViZUNBMB4XDTI0MDkwNjEyMjkzNloXDTM0MDkwNTEyMjkzNlowFTETMBEGA1UE
                AxMKbWluaWt1YmVDQTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAL7R
                ocDG5KvIn9vo/eDnO16iKDKOZf0Bk+W45ArAjh3j+XXofkEArTlvsSRNK8Ivb7Mv
                gHVPu0nEsYFFNO5r3+lHQUiLvCK5xbTEW2o6hpm4FLLku+gqskNGgWMh6PpKTNjx
                gYn7r44ZKxVl2CzYhLQfBv/NFEO6aO95ZXw1c3cBC0eQ8sZ/BCo8CjnlT74iisOP
                j9VNouh+yhMkocJIQ/5EMpTcgtLg0rE2KzLp6HEH7CqVCZISC5TGDpmv00/2kzXS
                J5o64P2WWThfTUax/P5/48+ous7A3u+pSq6AeUy4lGwLXpl6d/YOI4nqqByiGI2B
                T83Bzntzy0zjkmJxSIMCAwEAAaNhMF8wDgYDVR0PAQH/BAQDAgKkMB0GA1UdJQQW
                MBQGCCsGAQUFBwMCBggrBgEFBQcDATAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQW
                BBQBnNitrTSBwnnpX1QKC0hFvevxyjANBgkqhkiG9w0BAQsFAAOCAQEAROQB9SEi
                cK+ZPkhZecRoTfZtgpKx6narODK3cmStUPrAVsYY5/NI7laabR/952fhS3TLfqkj
                ynrdGl/I4hwqS3cqST9N7gy0b8W1lJbCwNxK+p02gw2JdJwzscPvOB0IBGRNdSXm
                q0Du5YTEhJsq0VgW9m936hZ+ygapv4pUQwvunrKb6xUV6sdsS7iiQ8gQI/J9G4OS
                7nfa1TfU8WX0yHbxiU3UUmJ7epdchW6/oWuvCplKndszKbZsTVzVlYRa5LakrRac
                5FX4zry9iQxFP8Uu71d9YWgzqP0tJC+9PRlARpoZq4gTGgllfAXgJ/zRSI0yPMDx
                ruv00gJ+feoOfA==
                -----END CERTIFICATE-----''', credentialsId: 'k8s-secret', serverUrl: 'https://192.168.58.2:8443') {
                    sh 'kubectl get nodes'
                }
            }
        }
    }
}
