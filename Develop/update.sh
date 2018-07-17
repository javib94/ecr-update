#!/bin/bash
eval $(aws ecr get-login --no-include-email --region us-east-2 | sed 's|https://||')
aws ecr get-login --no-include-email --region us-east-2 
docker build -t ecs-javi-repository ./django
docker tag ecs-javi-repository:latest 797409686075.dkr.ecr.us-east-2.amazonaws.com/ecs-javi-repository:latest
docker push 797409686075.dkr.ecr.us-east-2.amazonaws.com/ecs-javi-repository:latest
