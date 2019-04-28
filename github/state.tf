terraform {
  backend "s3" {
    bucket = "ewilde-terraform-us"
    key    = "goto-terraform/github.state"
    region = "us-east-1"
  }
}
