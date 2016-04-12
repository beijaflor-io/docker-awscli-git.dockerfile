create:
	eval $(aws --profile default ecr --region us-east-1 get-login)
	aws --profile default ecr --region us-east-1 create-repository --repository-name docker-awscli-git
	docker build -t 102103889482.dkr.ecr.us-east-1.amazonaws.com/docker-awscli-git:`git rev-parse HEAD` .
	docker push 102103889482.dkr.ecr.us-east-1.amazonaws.com/docker-awscli-git:`git rev-parse HEAD`
	docker tag 102103889482.dkr.ecr.us-east-1.amazonaws.com/docker-awscli-git:`git rev-parse HEAD` \
		102103889482.dkr.ecr.us-east-1.amazonaws.com/docker-awscli-git:latest
	docker push 102103889482.dkr.ecr.us-east-1.amazonaws.com/docker-awscli-git:latest
