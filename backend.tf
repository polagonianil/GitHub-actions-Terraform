terraform {
  backend "s3" {
    bucket = "github-actions-tflint-tfsec-09"
    key    = "github-action-demo-tfstate"
    region = "us-east-1"
  }
}

terraform {
  required_version = ">= 0.14.0"  # Specify your desired version
}
