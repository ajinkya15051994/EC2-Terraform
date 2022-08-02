output "ec2_public_dns" {
  value = aws_instance.node.public_dns
}

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.node.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.node.public_ip
}
