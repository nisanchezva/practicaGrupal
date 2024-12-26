pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                // Esto es para hacer checkout del código desde el repositorio de Git
                git 'https://github.com/nisanchezva/practicaJenkins.git' // Cambia esta URL por tu repositorio si es necesario
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
    }
}

