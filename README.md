# Project: Capstone (Udacity Cloud DevOps Nanodegree)

- ```
  - Working in AWS
  - Using Jenkins to implement Continuous Integration and Continuous Deployment
  - Building pipelines
  - Working with CloudFormation to deploy clusters
  - Building Kubernetes clusters
  - Building Docker containers in pipelines
  
  Final ELB Link
  http://a4b7f4532a1ff4adcb79432d52e33818-1086455622.us-east-1.elb.amazonaws.com/
  ```

  ## File Structure

  ```shell
  build_docker.sh : to build the docker image
  upload_docker.sh : to upload docker image to the docker hub
  Jenkinsfile : to define and work with pipelines
  Makefile: to install hadolint and lint dockerfile
  clusers/:
  config.yaml : creation of a cluster file
  deploy.yaml : deployment file
  app/: a project that will render html file on the default home route ("e.g /")
  package.json : main configuration file of a node project
  index.js : main server file
  Dockerfile : dockerfile that consists step of installing dependencies, commands to run an app
  static/index.html : html file that will be rendered
  start_docker.sh : main command to start application within kubernates cluster
  screenshots: All the steps screenshots are uploaded on screenshot folder
  ```

  
