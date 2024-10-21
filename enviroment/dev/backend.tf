terraform {
  backend "s3" {
    bucket = "demo-s3-bucket-tf-remote-backend-123"
    key    = "new/terraform.tfstate"
    region = "ap-south-1"
  }
}
