pipeline {
    agent any

    environment {
        PATH = "/usr/local/bin:$PATH"
    }
/// stages ni
    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t tabler-react-app .'
            }
        }
// stage hiilee
        stage('Run Container') {
            steps {
                sh '''
                    docker rm -f tabler-react-app || true
                    docker run -d -p 3000:80 --name tabler-react-app tabler-react-app
                '''
            }
        }

        stage('Build React App') {
  steps {
    sh 'yarn install'
    sh 'yarn build'
    sh 'ls -la build' // <- энэ нэмэлтээр build фолдер үүсэж буй эсэхийг харна
  }
}
    }
}
