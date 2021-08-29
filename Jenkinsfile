pipeline {
    agent any
    
    tools {
        dockerTool 'docker'
    }

    stages {
        stage('Git Clone') {
            steps {
                git changelog: false, poll: false, url: 'https://github.com/ayushpadia/hello-world-webapp.git'
            }
        }
        

    stage('Deploy') {
        steps {
		script {
          		withDockerRegistry(credentialsId: 'dockerhub-ayush-personal', toolName: 'docker') {
            		def image = docker.build("ayushanonymous/echo-server:$BUILD_NUMBER")
            		image.push()
          		}
        	}
      	}
        }
    }
}
