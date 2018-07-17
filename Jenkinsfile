pipeline{
  agent none
  agent{
    label 'ecr'
  }
  stages{
    stage('Build'){
      steps{
        sh 'docker-compose -f ./Develop/docker-compose.yml'
      }
    }
    stage('Test'){
      steps{

      }
    }
    stage('Deploy'){
      steps{

      }
    }


  }
}
