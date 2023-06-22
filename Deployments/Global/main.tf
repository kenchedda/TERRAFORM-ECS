# ---Global/main.tf---

provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {
    bucket  = "terraform-state-ken"
    key     = "Deployments/global/global.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

module "s3" {
  source = "../../Modules/s3"
  bucket_name = "ken-us-east-2-elb-access-logs"
  environment = "prod"
  enable_encryption = true
  enable_versioning = false
  account_id = "*"
}