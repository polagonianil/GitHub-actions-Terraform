pipeline {
    agent any
    parameters {
        string(name: 'INSTANCE_TYPE', defaultValue: 't2.micro', description: 'Type of the EC2 instance')
        string(name: 'REGION', defaultValue: 'us-east-1', description: 'AWS region for deployment')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    sh "terraform init"
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    sh "terraform plan -var='instance_type=${params.INSTANCE_TYPE}' -var='region=${params.REGION}' -out=tfplan"
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                input 'Approve Terraform Apply?'
                script {
                    sh "terraform apply -auto-approve tfplan"
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
