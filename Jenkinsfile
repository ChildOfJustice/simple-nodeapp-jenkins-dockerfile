pipeline {
    
    agent { label 'spot-instances' }
    //agent none
    //agent { dockerfile true }
    environment { 

        BUILD = 'false'
        TEST = 'false'
        DELIVER = 'false'
        CREATE = 'true'
        PROJECT_FOLDER_NAME = 'TestProjSpotEC2'
        //HOME = '.'
    }
    stages {
        stage('Run container'){
            when {environment name: 'CREATE', value: 'true'} 
            //agent any
            steps {
                sh 'whoami'
                sh 'sudo service docker start'
                sh 'sudo docker build -t getting-started-jenkins .'
                sh 'sudo docker run -dp 3000:3000 getting-started-jenkins'
                input message: 'Finished using the web site? (Click "Proceed" to continue)' 
                sh 'echo "Terminating..."'
                sh 'sudo docker rm -f $(docker ps -a -q --filter ancestor="getting-started-jenkins")'
                sh 'sudo service docker stop'
            }
        }
        stage('Build'){
            when {environment name: 'BUILD', value: 'true'}  
            agent { dockerfile true }
            steps {
                sh 'yarn install --production'
                sh 'whoami'
                sh 'node src/index.js'
            }
        }
        stage('Deliver'){
            when {environment name: 'DELIVER', value: 'true'}  
            agent {
                docker { image 'node:12-alpine' }
            }
            steps {
                // sh script:'''
                //     sudo rm -rf /var/www/html/
                //     sudo mkdir /var/www/html/
                //     git clone ec2-user@${Build_Slave_IP}:/home/ec2-user/workspace/TestProjectWithSlaves/dist --config core.sshCommand="ssh -i /home/ec2-user/ec2-test.pem -o StrictHostKeyChecking=no"
                //     sudo cp -R ./dist/AngularWithJenkins/* /var/www/html/
                //     sudo rm -rf dist

                //     sudo service httpd start
                //     echo 'Now start the apache server on your EC2: $ sudo service httpd start'
                //     echo 'Visit http://<PUBLIC IP>/ to see your application in action.'
                // '''
                sh 'node --version'
                sh 'pwd'
                sh 'whoami'
                //sh 'node src/index.js'
                sh script:'''
                    node src/index.js
                '''
                input message: 'Finished using the web site? (Click "Proceed" to continue)' 
                sh 'echo "Terminating..."'
                //sh 'sudo service httpd stop'

            }
        }
    }

}
