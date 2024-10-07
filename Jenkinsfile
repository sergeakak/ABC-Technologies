pipeline 
{
    agent any
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
     

stage('Build Docker Image') 
       {
             steps 
             {
                sh 'cp /var/lib/jenkins/workspace/$JOB_NAME/target/ABCtechnologies-1.0.war /var/lib/jenkins/workspace/$JOB_NAME/ABC_tech.war'

                sh 'docker build -t abctech_app:$BUILD_NUMBER .'

                sh 'docker tag abctech_app:$BUILD_NUMBER serge24/abctech_app:$BUILD_NUMBER'
             }
				
        }

    }
}
