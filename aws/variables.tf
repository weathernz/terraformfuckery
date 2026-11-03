variable "aws_region" {
  description = "AWS region in which to create the infrastructure"
  type        = string
  default     = "ap-southeast-2"
}

variable "ssh_source_ipv4" {
  description = "Public IPv4 CIDR permitted to SSH to the EC2 instance"
  type        = string
}