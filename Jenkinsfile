pipeline{
  agent{
    label 'ecr'
  }
  stages{
    stage('Build'){
      steps{
        sh "/usr/local/bin/docker-compose -f ./Develop/docker-compose.yml build"

      }
    }



  }
}
