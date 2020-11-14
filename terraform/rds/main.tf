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

##################################################

resource "aws_db_instance" "rds_pesbuk" {
       allocated_storage                = 20
       storage_type         		= "gp2"
       engine                           = "mysql"
       engine_version                   = "5.7.26"
       instance_class                   = "db.t2.micro"
       port                             = 3306
       publicly_accessible              = true
       identifier                       = "db-sosmed"
       name				= var.database1 
       username                         = var.rdsuser
       password				= var.rdspass
       availability_zone		= "ap-northeast-2a"
       skip_final_snapshot		= true
}

resource "aws_db_instance" "rds_wordpress" {
       allocated_storage                = 20
       storage_type         		= "gp2"
       engine                           = "mysql"
       engine_version                   = "5.7.26"
       instance_class                   = "db.t2.micro"
       port                             = 3306
       publicly_accessible              = true
       identifier                       = "db-wordpress"
       name				= var.database2 
       username                         = var.rdsuser
       password				= var.rdspass
       availability_zone		= "ap-northeast-2a"
       skip_final_snapshot		= true
}
