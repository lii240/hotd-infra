terraform {
  backend "s3" {
    bucket         = "hotd-backend"
    key            = "terraform.tfstate"
    region         = "eu-west-2"
  }
}