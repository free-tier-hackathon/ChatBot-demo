# Pre-requisites
1. AWS account
2. GitHub account

# Installation guidelines
1. Fork repository
2. Create IAM user and aws access key
Detailed guide can be found [here](https://aws.amazon.com/premiumsupport/knowledge-center/create-access-key/)
3. Add AWS access key details to GitHub secrets
4. Create Elastic Container Registry repository
Detailed guide can be found [here](https://docs.aws.amazon.com/AmazonECR/latest/userguide/repository-create.html)
5. Enabel GitHub actions on your repository
6. Run github actions, the job will fail, but it will build a docker image and push it to ECR
7. create ECS cluster, service and task
Detailed guide can be found [here](https://aws.amazon.com/getting-started/tutorials/deploy-docker-containers/) on how to set up ECS while staying within free tier and how to destroy it afterwards. You can map the host port 80 to container port 8080. This should already start ECS and application should be accessible from EC2 default public DNS.
8.  To enable automated deployment flow download ECS task description as JSON and add to repository, reflect the json filename in GitHub actions file.
9. Commit the changes and this should trigger actions to re-deploy the application.


 # High level overview

![image info](high_level_overview.png)


# TODOs
1. fully automate infrastructure creation, ideally with cloud native services (CloudFormation) (must have)
2. add scheduling functionality of underlying EC2 instance (must have)
3. add billing reports (must have)
4. add deployment guidelines to GCP (cool to have)
5. add guidelines on setting up Cloud9 environment for development (cool to have)
6. add Quality Assurance steps as part of CI/CD pipeline (in between)
7. improve documentation with more detailed steps
8. create a pdf explaining the technology stack used
