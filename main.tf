provider "aws" {
    region = var.region  
}

resource "aws_instance" "foo" {
  ami           = "ami-05fa00d4c63e32376" # us-west-2
  instance_type = var.instance_type

  metadata_options {
    http_endpoint = "enabled"  # Set this to "enabled" or "disabled"
    http_tokens   = "required" # Ensure http_tokens is also set correctly
  }

  root_block_device {
    encrypted = true
  }

  tags = {
      Name = "TF-Instance"
  }
}
