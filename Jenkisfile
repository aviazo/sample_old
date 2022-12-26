pipeline {
        agent {
  label 'centos7'
} 

    stages {
        stage('Checkout Code') {
            steps {
                cleanWs()
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'github', url: 'git@github.com:aviazo/sample.git']]])
                 }
        }
        stage('Build') {
            steps {
                sh ''' export APP=DEVELOP;  
                    npm install;
                    ls;
                    echo $APP; '''
               
            }
        }
        stage('Test') {
            steps {
                sh 'nohup node index.js &'
                sh 'curl localhost:3000'
   
            }
        }
        stage('Package') {
            steps {
                sh "tar -czvf package-${BUILD_ID}.tar.gz *"
                archive '*.tar.gz'
            }
        }
    }
}
