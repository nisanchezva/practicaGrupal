pipeline {
    agent any

    tools {
        terraform 'terraform'  
    }

    stages {
        stage('Checkout') {
            steps {
                // Esto es para hacer checkout del código desde el repositorio de Git
                git branch: 'holarun1', url: 'https://github.com/jgarcia3htp/Terraform' 
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    // Aquí cargamos la clave pública desde Jenkins y la pasamos como variable a Terraform
                    withCredentials([file(credentialsId: 'prueba', variable: 'SSH_PUB_KEY')]) {
                        sh """
                            terraform ${action} --auto-approve -var "public_key=${SSH_PUB_KEY}"
                        """
                    }
                }
            }
        }

        stage('Get Public IP') {
            steps {
                script {
                    // Ip publica
                    def publicIp = sh(script: 'terraform output -raw server_public_ip', returnStdout: true).trim()
                    echo "Ip: ${publicIp}"
                }
            }
        }

    }
}

