#!/bin/bash 


aws configure set aws_access_key_id $2
aws configure set aws_secret_access_key $3
aws s3api create-bucket --bucket $1

printf 'terraform {\n\t required_version = ">=0.12.0"\n\t backend "s3" { \n\t region = "us-east-1"\n\t profile = "default"\n\t key ="terraformstatefile"\n\t bucket = "'${1}'" \n\t }\n}\n' > /home/cloud_user/deploy_iac_tf_ansible/backend.tf 

ws route53 list-hosted-zones | jq -r '.HostedZones| .[] | .Name'
