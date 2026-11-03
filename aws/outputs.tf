output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.tutorial.id
}

output "instance_private_ip" {
  description = "Private IPv4 address of the EC2 instance"
  value       = aws_instance.tutorial.private_ip
}

output "instance_public_ip" {
  description = "Public IPv4 address of the EC2 instance"
  value       = aws_instance.tutorial.public_ip
}