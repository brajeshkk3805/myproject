pipeline {
    
    agent any
    
    environment {
        imageName = "mysample"
        registryCredentials = "dockerhumrepo"
        registry = "index.docker.io/v1/"
        dockerImage = ''
    }
    
    stages {
        stage('Code checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/bkk-2020/myproject.git']]])                   }
        }
    

    stage('Build docker image') {
      steps{
        script {
          dockerImage = docker.build imageName
        }
      }
    }

    stage('Upload docker image in dockerhub') {
     steps{  
         script {
             docker.withRegistry( 'https://'+registry, registryCredentials ) {
             dockerImage.push('latest')
          }
        }
      }
    }
   
    stage('Docker Run') {
       steps{
         script {
                sh 'docker run -d -p 80:80 --rm --name myphpcontainer ' + registry + imageName
            }
         }
      }    
    }
}
