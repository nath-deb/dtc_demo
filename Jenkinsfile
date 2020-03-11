pipeline {
   agent any
    
    stages {
      stage ("Code Pull"){
            steps{
                echo  "********* Check out the code ********** "
                git credentialsId: 'git_cred', url: 'https://github.com/nath-deb/dtc_demo.git'
            }
        }
	  
      stage ("Maven Build"){
            steps{
                echo "########### Initializing Maven Build ############"
                echo "$WORKSPACE"
				sh "cd $WORKSPACE"
                sh "/opt/apache-maven-3.6.3/bin/mvn clean install"
            }
        }
      stage ("Docker Image Build"){
	        steps{
			    echo "####### Docker Image Build ##########"
				sh "cd $WORKSPACE"
				sh "docker build -t demodtchelloworld-image:v4 ."
	        }
      }
	  stage ("Select Proceed For Final Deployment"){
				steps {
					input('Want to proceed the build or abort?')
                 }
	        }
	  stage ("Application Deployment on Docker Container"){
	         steps{
	             echo "######### Deployming Microservice on Docker Container ###########"
	             sh "docker run --name=demo -d -p 8080:8080 demodtchelloworld-image:v4"
	            }
	       }
	  }
	}
