terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.13.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-2"
}

#############################################################
resource "aws_vpc" "my_project" { 
  cidr_block			= "10.0.0.0/16"
  instance_tenancy  		= "default"
  enable_dns_hostnames		= "true"
  enable_dns_support		= "true"
   
  tags = {
      Name = "vpc-my_project"
  }
} 

resource "aws_route_table" "route_table" {
  vpc_id 			= aws_vpc.my_project.id
  
  tags = {
      Name = "rtb-my_project"
  }
}

resource "aws_subnet" "subnet_a" {
  vpc_id      			= aws_vpc.my_project.id
  cidr_block			= "10.0.10.0/24"
  availability_zone		= "ap-northeast-2a"
  map_public_ip_on_launch 	= "true"

  tags = {
      Name = "pub-sub1"
  }
}

resource "aws_subnet" "subnet_b" {
  vpc_id      			= aws_vpc.my_project.id
  cidr_block			= "10.0.11.0/24"
  availability_zone		= "ap-northeast-2b"
  map_public_ip_on_launch 	= "true"

  tags = {
      Name = "pub-sub2"
  }
}

resource "aws_subnet" "subnet_c" {
  vpc_id      			= aws_vpc.my_project.id
  cidr_block			= "10.0.12.0/24"
  availability_zone		= "ap-northeast-2c"
  map_public_ip_on_launch 	= "true"

  tags = {
      Name = "pub-sub3"
  }
}
resource "aws_subnet" "subnet_d" {
  vpc_id      			= aws_vpc.my_project.id
  cidr_block			= "10.0.13.0/24"
  availability_zone		= "ap-northeast-2d"
  map_public_ip_on_launch 	= "true"

  tags = {
      Name = "pub-sub4"
  }
}

resource "aws_internet_gateway" "gateway" {
  vpc_id 			= aws_vpc.my_project.id
  
  tags = {
      Name = "igw-project"
  }
}


resource "aws_main_route_table_association" "vpc_association" {
  vpc_id         = aws_vpc.my_project.id
  route_table_id = aws_route_table.route_table.id
}


resource "aws_route_table_association" "subnet_association_a" {
   subnet_id	  = aws_subnet.subnet_a.id
   route_table_id = aws_route_table.route_table.id
}

resource "aws_route_table_association" "subnet_association_b" {
   subnet_id	  = aws_subnet.subnet_b.id
   route_table_id = aws_route_table.route_table.id
}

resource "aws_route_table_association" "subnet_association_c" {
   subnet_id	  = aws_subnet.subnet_c.id
   route_table_id = aws_route_table.route_table.id
}
resource "aws_route_table_association" "subnet_association_d" {
   subnet_id	  = aws_subnet.subnet_d.id
   route_table_id = aws_route_table.route_table.id
}
resource "aws_security_group" "sg_costume" {
  name        = "my_project"
  description = "Terraform Created"
  vpc_id      = aws_vpc.my_project.id

  ingress {
    description = ""
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = ""
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = ""
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = ""
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = ""
    from_port   = 5601
    to_port     = 5601
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = ""
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg-costume"
  }
}
