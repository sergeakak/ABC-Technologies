pipeline 
{
    agent any

 environment 
       {
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


stage('Copy War File') {
            steps {
                sh 'cp ${WORK_DIR}/target/ABCtechnologies-1.0.war abc_tech.war'
            }
        }


stage('Deploy as Container with Ansible Playbook') 
           {
             steps {
                    
                    script {
                             ansiblePlaybook credentialsId: 'myansible2',
			            disableHostKeyChecking: true,
			                      installation: 'ansible',
			                         inventory: 'nodes.inv',
			                          playbook: 'deploy_docker_playbook.yml',
			                      vaultTmpPath: ''
			}
                  } 
            }

stage('Deploy on kubernetes') 
           {
             steps {
                    
                    script {
                             ansiblePlaybook credentialsId: 'myansible2',
			            disableHostKeyChecking: true,
			                      installation: 'ansible',
			                         inventory: 'nodes.inv',
			                          playbook: 'deployment-playbook.yml',
			                      vaultTmpPath: ''
		          }
		         	
                   } 
                  
            }

    }
}
