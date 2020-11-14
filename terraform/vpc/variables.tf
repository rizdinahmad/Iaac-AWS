variable "vpc_subnet_ips" { 
	type = list 
	default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"] 
}

variable "vpc_subnet_names" { 
	type = list 
	default = ["subnet-a", "subnet-b", "subnet-c"] 
}

variable "vpc_subnet_azs" { 
	type = list 
	default = ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c"] 
}
