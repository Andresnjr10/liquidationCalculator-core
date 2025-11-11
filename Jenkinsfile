pipeline {
    agent any

    environment {
        DOCKERHUB_USER = credentials('dockerhub-user')  // nombre del credential en Jenkins
        DOCKERHUB_PASS = credentials('dockerhub-pass')
        IMAGE_NAME = "emmanuelcalad/liquidation-calculator"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/emmanuelcalad0615/liquidationCalculator-core.git'
            }
        }

        stage('Build') {
            steps {
                echo 'Compilando el proyecto...'
                bat 'mvn clean package -DskipTests'  // usa 'bat' porque estás en Windows
            }
        }

        stage('Test') {
            steps {
                echo 'Ejecutando pruebas unitarias...'
                bat 'mvn test'
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    bat 'docker build -t %IMAGE_NAME%:latest .'
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                script {
                    bat """
                    echo %DOCKERHUB_PASS% | docker login -u %DOCKERHUB_USER% --password-stdin
                    docker push %IMAGE_NAME%:latest
                    """
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline finalizado'
        }
    }
}
