/* pipeline {
    agent { docker 'php' }
    stages {
        stage('build') {
            steps {
                sh 'php --version'
            }
        }
    }
} */
pipeline { 
    
    environment { 
        registry = "comfyneko/dockertest" 
        registryCredential = 'dockertest' 
        dockerImage = '' 
    }
    agent any 
    stages { 
        stage('Cloning our Git') { 
            steps { 
                git url:'https://github.com/ComfyNeko/pipeline.git', branch: 'main'
            }
        } 

        stage('Building our image') { 
            steps { 
                script { 
                    dockerImage = docker.build  registry + ":$BUILD_NUMBER"
                }
            } 
        }
        stage('Deploy our image') { 
            steps { 
                script { 
                    docker.withRegistry( '', registryCredential ) { 
                        dockerImage.push() 
                    }
                } 
            }
        } 
        stage('Cleaning up') { 
            steps { 
                sh "docker rmi $registry:$BUILD_NUMBER" 
            }
        } 
    }
}
