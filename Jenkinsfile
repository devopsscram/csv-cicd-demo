pipeline {
    agent any

    environment {
        GIT_REPO = 'https://github.com/devopsscram/csv-cicd-demo.git'
        GIT_BRANCH = 'main'
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: "${GIT_BRANCH}",
                    credentialsId: 'github-creds',
                    url: "${GIT_REPO}"
            }
        }

        stage('Update CSV') {
            steps {
                sh '''
                    DATE=$(date +"%Y-%m-%d")
                    ID=$(($(tail -n 1 data.csv | cut -d',' -f1)+1))

                    echo "$ID,JenkinsUser,$DATE" >> data.csv

                    echo "Updated CSV:"
                    cat data.csv
                '''
            }
        }

        stage('Commit and Push') {
            steps {
                sh '''
                    git config user.name "jenkins"
                    git config user.email "jenkins@example.com"

                    git add data.csv

                    git diff --cached --quiet || \
                    git commit -m "Auto update CSV from Jenkins build ${BUILD_NUMBER}"

                    git push origin ${GIT_BRANCH}
                '''
            }
        }
    }
}
