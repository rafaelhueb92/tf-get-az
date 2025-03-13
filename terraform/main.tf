provider "aws" {
  region = "us-east-1"
}

data "aws_vpc" "main" {
  default = true 
}

data "aws_subnets" "all_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.main.id ]
  }
}

output "subnet_ids" {
  value = [for subnet in data.aws_subnets.all_subnets.ids : subnet 
            if strcontains(subnet,"bb")]
}
