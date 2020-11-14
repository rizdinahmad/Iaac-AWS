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

locals {
  user_data = <<EOF
#!/bin/bash
sleep 30s
sudo apt-get update -y
sudo apt-get install python -y
ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa <<< y
EOF
}

#############################################################

resource "aws_instance" "bastion_clusters" {
   count			     	= "1" 
   ami                          	= "ami-064ab8637cf33f1bb"
   tenancy                      	= "default"
   associate_public_ip_address  	= true 
   availability_zone            	= "ap-northeast-2a"
   key_name		     		= "sshec2"
   instance_type                	= "t2.medium" 
   monitoring                   	= true

   subnet_id				= var.subnet 
   vpc_security_group_ids              	= [
            var.security_group
       ]
   
   tags                         	= {
     		Name	= "bastion-cluster"
        } 
           
   root_block_device {
           delete_on_termination 	= true 
           volume_size           	= 10 
           volume_type           	= "gp2" 
        }
   user_data_base64			= base64encode(local.user_data)
}
