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


    }
}
