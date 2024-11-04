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
                git branch: 'main', url: 'https://github.com/polagonianil/Jenkins-pipeline-Terraform.git'
            }
        }

        stage('Debug Directory') {
            steps {
                bat 'dir'  // This will print the contents of the workspace for verification
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    // Adjust the path if necessary based on the 'Debug Directory' output
                    bat 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    bat "terraform plan -var=\"instance_type=${params.INSTANCE_TYPE}\" -var=\"region=${params.REGION}\" -out=tfplan"
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                input 'Approve Terraform Apply?'
                script {
                    bat "terraform apply -auto-approve tfplan"
                }
            }
        }
    }
}
