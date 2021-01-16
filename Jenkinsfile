pipeline {
    agent none
    environment { 

        BUILD = 'false'
        TEST = 'false'
        DELIVER = 'true'

        PROJECT_FOLDER_NAME = 'TestProjSpotEC2'

    }
    stages {
        stage('Build'){
            when {environment name: 'BUILD', value: 'true'}
            agent { dockerfile true }
            steps {
                // TODO CHANGE BUILD STAGE
                sh script:'''
                    #!/bin/bash
                    rm -r -f dist

                    mkdir Repository
                    cd Repository
                    git clone ec2-user@${Source_Slave_IP}:/home/ec2-user/workspace/TestProjectWithSlaves/${PROJECT_FOLDER_NAME} --config core.sshCommand="ssh -i /home/ec2-user/ec2-test.pem -o StrictHostKeyChecking=no"
                    cd ${PROJECT_FOLDER_NAME}
                    npm install
                    npm run build
                    
                    mv ./dist /home/ec2-user/workspace/TestProjectWithSlaves/
                    cd /home/ec2-user/workspace/TestProjectWithSlaves/dist
                    git init
                    git add .
                    git commit -m "Another push" -a

                    cd /home/ec2-user/workspace/TestProjectWithSlaves/
                    rm -f -r Repository
                '''
                

            }
        }
        
        stage('Test'){
            when {environment name: 'TEST', value: 'true'}  
            agent { dockerfile true }
            steps {

                //TODO CHANGE
                sh 'sudo yum install -y gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget'

                sh 'git clone ec2-user@${Source_Slave_IP}:/home/ec2-user/workspace/TestProjectWithSlaves/${PROJECT_FOLDER_NAME} --config core.sshCommand="ssh -i /home/ec2-user/ec2-test.pem -o StrictHostKeyChecking=no"'
                
                sh script:'''
                    #!/bin/bash
                    cd ${PROJECT_FOLDER_NAME}
                    npm install
                    npm install karma-chrome-launcher --save-dev
                    npm i --save-dev puppeteer
                    npm run test
                '''
                
            }
        }
        
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

                sh script:'''
                    node src/index.js
                '''
                input message: 'Finished using the web site? (Click "Proceed" to continue)' 
                sh 'echo "Terminating..."'
                sh 'sudo service httpd stop'

            }
        }
    }
}
        
