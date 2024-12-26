pipeline {
    agent any

    tools {
        terraform 'terraform'  
    }

    stages {
        stage('Checkout') {
            steps {
                // Esto es para hacer checkout del código desde el repositorio de Git
                git branch: 'main', url: 'https://github.com/nisanchezva/practicaGrupal' // Cambia esta URL por tu repositorio si es necesario
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    // Ejecuta el terraform init para inicializar el directorio de trabajo
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
                            terraform apply -auto-approve -var "public_key=${SSH_PUB_KEY}"
                        """
                    }
                }
            }
        }

          stage('Print Public Key') {
            steps {
                script {
                    // Obtener el valor de salida 'public_key_output' y mostrarlo
                    def publicKey = sh(script: "cat ${SSH_PUB_KEY}", returnStdout: true).trim()
                    echo "Public Key: ${publicKey}"
                }
            }
        }

    }
}

