pipeline {
    agent any
    stages {
        
        stage('---- Build Started ---- '){
            steps{
                sh "echo Building ${env.JOB_NAME} ${env.BUILD_NUMBER}"
            }
        }
        
        stage('---- Checking and Installing Hadolint ----'){
            steps{
                sh '''
                    if ! [ -x "$(command -v hadolint)" ]; then
                        echo 'Installing hadolint' >&2
                        make install
                    fi
                '''
            }
        }
        
        stage('---- Linting Docker File ----'){
            steps{
                sh 'make lint'
            }
        }
        
        stage('---- Building Docker Image ----') {
            steps {
                sh 'bash build_docker.sh'
            }
        }
        
        stage('---- Pushing Docker Image ----') {
            steps {
                withDockerRegistry([url: "", credentialsId: "docker-id"]) {
                    sh 'bash upload_docker.sh'
                }
            }
        }
  
         stage('---- Deploying app to AWS EKS ----') {
              steps{
                  echo 'Deploying to AWS EKS ....'
                  withAWS(credentials: 'capstone', region: 'us-east-1') {
                      sh "aws eks --region us-east-1 update-kubeconfig --name udacity-capstone-project"
                      sh "kubectl config use-context arn:aws:eks:us-east-1:084727192731:cluster/udacity-capstone-project"
                      sh "kubectl apply -f ./cluster/deploy.yaml"
                      sh "kubectl get nodes"
                      sh "kubectl get deployments"
                      sh "kubectl get pod -o wide"
                      sh "kubectl get service/capstone-app"
                }
            }
        }
        
        stage('---- Checking app status ----') {
              steps{
                  echo 'Checking app status'
                  withAWS(credentials: 'capstone', region: 'us-east-1') {
                     sh ""
                }
            }
        } 
        
        stage('---- Checking rollout ----') {
              steps{
                  echo 'Checking rollout...'
                  withAWS(credentials: 'capstone', region: 'us-east-1') {
                     sh "kubectl rollout status deployments/capstone-app"
                }
            }
        }
    }
}
