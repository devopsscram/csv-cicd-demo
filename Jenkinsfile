pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Validate CSV') {
            steps {
                sh '''
                python3 - <<EOF
import csv

with open('data/employees.csv') as f:
    rows = list(csv.reader(f))

print(f"CSV contains {len(rows)-1} records")
EOF
                '''
            }
        }

        stage('Deploy') {
            steps {
                sh './scripts/deploy.sh'
            }
        }
    }

    post {
        success {
            echo 'Deployment Successful'
        }

        failure {
            echo 'Deployment Failed'
        }
    }
}
