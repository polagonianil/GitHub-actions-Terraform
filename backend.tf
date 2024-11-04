terraform {
  backend "s3" {
    bucket = "github-actions-tflint-tfsec-09"
    key    = "github-action-demo-tfstate"
    region = "us-east-1"
  }
}