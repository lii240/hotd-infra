terraform {
  backend "s3" {
    bucket         = "hodt-backend"
    key            = "terraform.tfstate"
    region         = "eu-west-2"
  }
}