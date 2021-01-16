pipeline {
    agent none
    environment { 

        BUILD = 'false'
        TEST = 'false'
        DELIVER = 'true'

        PROJECT_FOLDER_NAME = 'TestProjSpotEC2'

    }
    stages {
        
        stage('Deliver'){
            when {environment name: 'DELIVER', value: 'true'}  
            agent { dockerfile true }
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

                // sh script:'''
                //     node src/index.js
                // '''
                input message: 'Finished using the web site? (Click "Proceed" to continue)' 
                sh 'echo "Terminating..."'
                //sh 'sudo service httpd stop'

            }
        }
    }
}
        
