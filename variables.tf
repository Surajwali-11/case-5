variable "region" {
  default = "us-east-2"
}

variable "bucket_name" {
  default = "cs5-shared-bucket"
}

variable "instance_type" {
  default = "t2.medium"
}

variable "ami_id" {
  description = "Amazon Linux 2 AMI"
  default     = "ami-0d1b5a8c13042c939"
}
