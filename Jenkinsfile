pipeline {
    agent any
    stages {
        
        stage('Build Started'){
            steps{
                sh "echo Building ${env.JOB_NAME} ${env.BUILD_NUMBER}"
            }
        }
        
        stage('Installing hadolint if doesnt exist'){
            steps{
                sh '''
                    if ! [ -x "$(command -v hadolint)" ]; then
                        echo 'Installing hadolint' >&2
                        make install
                    fi
                '''
            }
        }
        
        stage('Lint Docker File'){
            steps{
                sh 'make lint'
            }
        }
        
        /* stage('Security Scan') {
            steps { 
                aquaMicroscanner imageName: 'node:10.15.0-alpine', notCompliesCmd: 'exit 1', onDisallowed: 'fail', outputFormat: 'html'
            }
        } */   
        
        stage('Build Docker Image') {
            steps {
                sh 'bash build_docker.sh'
            }
        }
        
        stage('Push Docker Image') {
            steps {
                withDockerRegistry([url: "", credentialsId: "docker-id"]) {
                    sh 'bash upload_docker.sh'
                }
            }
        }
        
        stage('Deploying') {
              steps{
                  echo 'Deploying to AWS...'
                  withAWS(credentials: 'capstone', region: 'us-east-1') {
                      sh "aws eks --region us-east-1 update-kubeconfig --name udacity-capstone"
                      sh "kubectl config use-context arn:aws:eks:us-east-1:363487036927:cluster/udacity-capstone"
                      sh "kubectl apply -f ./kubernetes/cluster_deploy.yaml"
                      sh "kubectl get nodes"
                      sh "kubectl get deployments"
                      sh "kubectl get pod -o wide"
                      sh "kubectl get service/capstone-app"
                }
            }
        }
        
         stage('Checking if app is up') {
              steps{
                  echo 'Checking if app is up...'
                  withAWS(credentials: 'capstone', region: 'us-east-1') {
                     sh ""
                }
            }
        } 
        
        stage('Checking rollout') {
              steps{
                  echo 'Checking rollout...'
                  withAWS(credentials: 'capstone', region: 'us-east-1') {
                     sh "kubectl rollout status deployments/capstone-app"
                }
            }
        }
        
        stage("Cleaning up") {
              steps{
                    echo 'Cleaning up...'
                    sh "docker system prune"
            }
        }
    }
}
