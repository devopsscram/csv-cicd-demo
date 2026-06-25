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
                    ID=$(($(tail -n 1 employees.csv | cut -d',' -f1)+1))

                    echo "$ID,JenkinsUser,$DATE" >> employees.csv

                    echo "Updated CSV:"
                    cat employees.csv
                '''
            }
        }

        stage('Commit and Push') {
            steps {
                sh '''
                    git config user.name "devopsscram"
                    git config user.email ""himalayanscram9@gmail.com"

                    git add employees.csv

                    git diff --cached --quiet || \
                    git commit -m "Auto update CSV from Jenkins build ${BUILD_NUMBER}"

                    git push origin ${GIT_BRANCH}
                '''
            }
        }
    }
}
