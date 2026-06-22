@Library('shared-lib') _

pipeline {

    agent any

    parameters {

        string(
            name: 'EMP_ID',
            defaultValue: '',
            description: 'Employee ID'
        )

        string(
            name: 'EMP_NAME',
            defaultValue: '',
            description: 'Employee Name'
        )

        string(
            name: 'DEPARTMENT',
            defaultValue: '',
            description: 'Department'
        )
    }

    environment {

        CSV_FILE = "data/employees.csv"

    }

    stages {

        stage('Checkout') {

            steps {

                checkout scm

            }
        }

        stage('Append CSV') {

            steps {

                appendCsv(
                    env.CSV_FILE,
                    params.EMP_ID,
                    params.EMP_NAME,
                    params.DEPARTMENT
                )

            }
        }

        stage('Commit Changes') {

            steps {

                withCredentials([
                    usernamePassword(
                        credentialsId: 'github-creds',
                        usernameVariable: 'GIT_USER',
                        passwordVariable: 'GIT_PASS'
                    )
                ]) {

                    sh '''
                        git config user.email "jenkins@company.com"
                        git config user.name "Jenkins"

                        git add .

                        git commit -m "Added new employee record" || true

                        git push https://${GIT_USER}:${GIT_PASS}@github.com/USERNAME/csv-cicd-demo.git HEAD:main
                    '''
                }
            }
        }
    }
}
