pipeline {
    agent any

    triggers {
        pollSCM '* * * * *'
    }
    tools {
        maven 'Maven' 
    }

    environment {
        CI = false //do not treat errors as warnings
    }


  stages {
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }


    stage ('Deployment') {
            steps {
                sh 'docker build -t wordsmith-web'
                sh 'docker tag wordsmith-web:${BUILD_NUMBER} jaymath237/wordsmith-web'
                sh 'docker login -u ${USERNAME} -p ${PASSWORD} docker.io'
                sh 'docker push  jaymath237/wordsmith-web'
            }
        }

    }

}
