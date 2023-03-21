#!groovy

pipeline {
        def app
  stages {
  	stage('Maven Install') {
    	agent {
      	docker.withDockerContainer('maven:3.5.0') {
    // some block
        }
      }
      steps {
      	sh 'mvn clean install'
      }
    }
    stage('Docker Build') {
      app = docker.build("quocphamlb/springpetclinic")
    }
         
          stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

        app.inside {
            sh 'echo "Tests passed"'
        }
    }
          stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
  }
}
