pipeline {
    agent {
        node {
            label 't055-runner'
        }
    }
    
    stages {
        stage('Checkout') {
            steps {
                git credentialsId: 'ca-git-access', branch: 'development', url: 'https://git.cloudavise.com/visops/t055/sample-nodejs-app.git'
            }
        }
        
        stage('Build') {
            steps {
                sh 'npm install'
            }
        }
        
        stage('Test') {
            steps {
                sh './jenkins/scripts/test.sh'
            }
        }
        
        stage('Deliver') {
            steps {
                sh './jenkins/scripts/deliver.sh'
            }
        }
        
        stage('Install nginx') {
            steps {
                sh '''
                    ansible-vault decrypt --vault-id /home/ubuntu/tmp/vault-id jenkins-key.pem
                    chmod 400 jenkins-key.pem
                    ansible-playbook -i inventory install-nginx.yml
                '''
            }
        }
        
        stage('Deploy Build') {
            steps {
                sh 'ansible-playbook -i inventory deploy-nginx.yml'
            }
        }
    }
}
