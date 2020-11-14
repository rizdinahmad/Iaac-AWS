output "vpc_id" {
   value   = aws_vpc.bigproject.id
}

output "subnet_id" {
   value   = aws_subnet.subnet_a.id
}

output "security_group" {
   value   = aws_security_group.sg_jenkins.id
}

