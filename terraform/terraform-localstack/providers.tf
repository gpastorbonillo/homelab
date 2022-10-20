terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}

variable "token" {
  type    = string
}

provider "github" {
  token = var.token 
  owner = "gpastorbonillo"
}

provider "aws" {
  access_key                  = "test"
  secret_key                  = "test"
  region                      = "us-east-1"
  s3_force_path_style         = false
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    apigateway     = "http://localstack.gpastor.net:4566"
    apigatewayv2   = "http://localstack.gpastor.net:4566"
    cloudformation = "http://localstack.gpastor.net:4566"
    cloudwatch     = "http://localstack.gpastor.net:4566"
    dynamodb       = "http://localstack.gpastor.net:4566"
    ec2            = "http://localstack.gpastor.net:4566"
    es             = "http://localstack.gpastor.net:4566"
    elasticache    = "http://localstack.gpastor.net:4566"
    firehose       = "http://localstack.gpastor.net:4566"
    iam            = "http://localstack.gpastor.net:4566"
    kinesis        = "http://localstack.gpastor.net:4566"
    lambda         = "http://localstack.gpastor.net:4566"
    rds            = "http://localstack.gpastor.net:4566"
    redshift       = "http://localstack.gpastor.net:4566"
    route53        = "http://localstack.gpastor.net:4566"
    s3             = "http://localstack.gpastor.net:4566"
    secretsmanager = "http://localstack.gpastor.net:4566"
    ses            = "http://localstack.gpastor.net:4566"
    sns            = "http://localstack.gpastor.net:4566"
    sqs            = "http://localstack.gpastor.net:4566"
    ssm            = "http://localstack.gpastor.net:4566"
    stepfunctions  = "http://localstack.gpastor.net:4566"
    sts            = "http://localstack.gpastor.net:4566"
  }
}
