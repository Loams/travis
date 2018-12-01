#!/bin/bash

set -e
docker --version  # document the version travis is using
pip install --user awscli # install aws cli w/o sudo
export PATH=$PATH:$HOME/.local/bin # put aws in the path
eval $(aws ecr get-login --region us-east-1) #needs AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY envvars
# tag and push docker image to aws container registry
docker tag travis_app 874513637261.dkr.ecr.eu-west-3.amazonaws.com/travis:latest
docker tag 874513637261.dkr.ecr.eu-west-3.amazonaws.com/travis:${TRAVIS_BUILD_NUMBER}

docker push 874513637261.dkr.ecr.eu-west-3.amazonaws.com/travis:latest
docker push 874513637261.dkr.ecr.eu-west-3.amazonaws.com/travis:${TRAVIS_BUILD_NUMBER}


# create zip file for elastic beanstalk deployment
#cp Dockerrun-app.aws.json Dockerrun.aws.json
#sed -i s/%TAG%/${TRAVIS_BUILD_NUMBER}/g Dockerrun.aws.json
#zip travis_app_deploy.zip Dockerrun.aws.json docker/nginx/aws.conf


# terraform aws
#curl -O https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
#unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip
#./build/terraform.sh common ${AWS_PROFILE} ${RDS_MASTER_PASSWORD}
#./build/terraform.sh beanstalk ${AWS_PROFILE} ${RDS_MASTER_PASSWORD}
