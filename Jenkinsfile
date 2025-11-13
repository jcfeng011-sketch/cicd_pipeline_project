pipeline {
    agent any

    environment {
        WEBEX_ROOM_ID = credentials('webex-room-id')
        WEBEX_AUTH_TOKEN = credentials('webex-auth-token')
    }

    stages {
        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/jcfeng011-sketch/cicd_pipeline_project.git',
                branch: 'master',
                credentialsId: 'github-credentials'
            }
        }

        stage('Build') {
            steps {
                sh 'chmod +x build.sh'
                sh './build.sh'
            }
        }

        stage('Test') {
            steps {
                sh 'chmod +x test.sh'
                sh './test.sh'
            }
        }
    }

    post {
        success {
            sh """
            curl -X POST https://webexapis.com/v1/messages \
            -H "Authorization: Bearer ${WEBEX_AUTH_TOKEN}" \
            -H "Content-Type: application/json" \
            -d '{"roomId":"${WEBEX_ROOM_ID}","text":"✅ Build #${BUILD_NUMBER} Success!"}'
            """
        }

        failure {
            sh """
            curl -X POST https://webexapis.com/v1/messages \
            -H "Authorization: Bearer ${WEBEX_AUTH_TOKEN}" \
            -H "Content-Type: application/json" \
            -d '{"roomId":"${WEBEX_ROOM_ID}","text":"❌ Build #${BUILD_NUMBER} Failed!"}'
            """
        }
    }
}
