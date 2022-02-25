output "ec2_instance_id" {
  value       = aws_instance.web.id
  description = "EC2 instance id"
}

output "ec2_instance_public_ip" {
  value       = aws_instance.web.public_ip
  description = "Public IP of the EC2 instance"
}