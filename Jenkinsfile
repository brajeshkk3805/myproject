pipeline {
    
    agent any
    
    environment {
        imageName = "mysample"
        registryCredentials = "dockerhub"
        registry = "index.docker.io/v1/"
        dockerImage = ''
    }
    
    stages {
        stage('Code checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/bkk-2020/myproject.git']]])                   }
        }
		
    stage ('maven  build'){
	    steps{
		     script{
			    def mavenHome=  tool name: 'Maven', type: 'maven'
                sh "${mavenHome}/bin/mvn --version"
                sh "${mavenHome}/bin/mvn clean install -DskipTests --fae"
			 }
		}
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
