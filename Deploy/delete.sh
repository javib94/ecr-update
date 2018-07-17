tasks=$(aws --region us-east-2 ecs list-tasks --cluster javib-ecs --query taskArns --output text)
for task in $tasks; do
    echo $task
	  aws --region us-east-2 ecs stop-task --task $task --cluster javib-ecs
done
