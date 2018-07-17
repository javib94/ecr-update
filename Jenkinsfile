pipeline{
  agent{
    label 'ecr'
  }
  stages{
    stage('Build'){
      steps{
        sh "docker-compose -f ./Develop/docker-compose.yml build"

      }
    }



  }
}
