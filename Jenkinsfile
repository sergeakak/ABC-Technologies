pipeline 
{
    agent any
  
environment {
        DOCKER_IMAGE = "serge24/abctech_app"
        WORK_DIR = "/var/lib/jenkins/workspace/ABC-Technologies-CI"
    }


    stages 
    {
        stage('Code Checkout') 
        {
	       steps 
               {
                  git 'https://github.com/sergeakak/ABC-Technologies.git'
               }
        }

        stage('Code Compile') 
       {
	     steps 
            {
               sh 'mvn compile'
            }
			
       }

        stage('Unit Test') 
       {
	    steps 
            {
               sh 'mvn test'
            }
			
       }

        stage('Build Code') 
        {
             steps 
             {
                sh 'mvn package'
             }
				
        }
   

stage('Build Docker Image') {
            steps {
                sh 'cp ${WORK_DIR}/target/ABCtechnologies-1.0.war abc_tech.war'
                sh 'docker build -t ${DOCKER_IMAGE}:latest .'
            }
        }


stage('Push Docker Image') {
            steps {
                withDockerRegistry([credentialsId: "mydocker", url: ""]) 
		{
                    sh 'docker push ${DOCKER_IMAGE}:latest'
                }
            }
        }


 stage('Deploy as container') {
            steps
            {
                sh 'docker run -itd -P --name tech_app ${DOCKER_IMAGE}:latest'
            }
        }


    }
}
