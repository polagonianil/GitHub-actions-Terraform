variable "instance_type" {
  description = "Type of the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "region" {
  description = "AWS region for deployment"
  type        = string
  default     = "us-east-1"
}
