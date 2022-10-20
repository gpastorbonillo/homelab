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

