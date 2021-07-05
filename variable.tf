variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type = string
  default = "us-east-2"
}

variable "aws_instance_type" {
  description = "EC2 Instance Type"
  type = string
  default = "t2.micro"
}

variable "instance_type_list" {
  description = "ec2_type list"
  type = list(string)
  default = [ "t3.micro", "t3.small"]
}

# AWS EC2 Instance Type - Map
variable "instance_type_map" {
  description = "EC2 Instnace Type"
  type = map(string)
  default = {
    "dev" = "t3.micro"
    "qa"  = "t3.small"
    "prod" = "t3.large"
  }
}