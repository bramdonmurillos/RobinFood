terraform {
  backend "s3" {
    bucket = "terraform-backend"
    key    = "terraform/bucket"
    region = "us-east-2"
  }
}