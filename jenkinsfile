pipeline {
    agent any
    parameters {
        string(name: 'INSTANCE_TYPE', defaultValue: 't2.micro', description: 'Type of the EC2 instance')
        string(name: 'REGION', defaultValue: 'us-east-1', description: 'AWS region for deployment')
    }

    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/polagonianil/Jenkins-pipeline-Terraform.git'
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    bat 'cd Jenkins-pipeline-Terraform && terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    bat "cd Jenkins-pipeline-Terraform && terraform plan -var=\"instance_type=${params.INSTANCE_TYPE}\" -var=\"region=${params.REGION}\" -out=tfplan"
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                input 'Approve Terraform Apply?'
                script {
                    bat "cd Jenkins-pipeline-Terraform && terraform apply -auto-approve tfplan"
                }
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: '*.tfstate', allowEmptyArchive: true
            cleanWs()
        }
    }
}
