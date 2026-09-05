provider "aws" {
  region = "ap-south-1"
}
terraform {
  backend "s3" {
    bucket         = "harsha8byte"
    key            = "3tier/prod/terraform.tfstate"
    region         = "ap-south-1"
    
  }
}
