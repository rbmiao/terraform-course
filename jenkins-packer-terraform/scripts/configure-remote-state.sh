#!/bin/sh
terraform remote config -backend=s3 -backend-config="bucket=terraform-20170323" -backend-config="key=terraform/terraform.tfstate" -backend-config="region=us-east-1"
