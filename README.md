# Get Credentials for AWS ECR

This is a simple script to get valid credentials for accessing ECR. The script will get the credentials and print a valid Docker config file to stdout.

## Usage

This script requires valid AWS credentials, which can be provided in different ways.

### Using the .aws/credentials file

You can mount your credentials file and run the container like this:

    docker run --rm -v /path/to/.aws/credentials:/root/.aws/credentials thepeak/ecr-get-credentials > your-docker-auth-file.json

### Using the AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY environment variables

You can provide the credentials using environment variables to the container like this:

    docker run --rm -e AWS_ACCESS_KEY_ID=xxxx -e AWS_SECRET_ACCES_KEY=yyyy thepeak/ecr-get-credentials > your-docker-auth-file.json

### Using an IAM role

In this case you don't have to do anything special to run the container, just make sure your EC2 instance has a role that gives it access to ECR.

    docker run --rm thepeak/ecr-get-credentials > your-docker-auth-file.json
