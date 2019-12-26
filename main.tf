terraform {
  required_version = "~> 0.12"

  backend "s3" {
    bucket         = "mooreds-tf-state-jenkinspoc"
    key            = "s3/terraform.tfstate"
    region         = "us-west-2"
  }
}

provider "aws" {
  version = "~> 2.13"
  profile = "jenkinspoc"
  region  = "us-west-2"
}

provider "template" {
  version = "~> 2.0"
}


resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket-test-mooreds"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
   lifecycle_rule {
    id      = "tmp"
    prefix  = "tmp/"
    enabled = true

    expiration {
      date = "2020-01-16"
    }
  }
}
