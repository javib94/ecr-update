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
    stage('Test'){
      steps{
        sh "/usr/local/bin/docker-compose -f ./Develop/docker-compose.yml up -d"
        sh "chmod a+x ./test.sh"
        script{
          flag = sh (script: './test.sh', returnStdout: true)
          echo "Resultado : ${flag}"
        }
        sh "/usr/local/bin/docker-compose -f ./Develop/docker-compose.yml down"
      }
    }
    stage('Deploy'){
      steps{
        script{
        echo "Resultado : ${flag}"
        if(flag.contains("PASSED")){
            version = sh (script: 'cat version', returnStdout: true)
            sh 'docker build -t ecs-javi-repository ./Develop/django'
            sh '$(aws ecr get-login --no-include-email --region us-east-2)'
            sh "docker tag ecs-javi-repository:latest 797409686075.dkr.ecr.us-east-2.amazonaws.com/ecs-javi-repository:latest"
            sh "docker push 797409686075.dkr.ecr.us-east-2.amazonaws.com/ecs-javi-repository:latest"
            sh "chmod a+x ./Deploy/delete.sh"
            sh "./Deploy/delete.sh"
        } else {
            echo "Test not passed"
          }
        }
        }
    }
  }
}
