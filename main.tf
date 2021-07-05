resource "aws_instance" "myec2vm" {
  ami = data.aws_ami.amzlinux2.id
  user_data = file("${path.module}/app1-install.sh")
  instance_type = var.aws_instance_type
  #instance_type = var.instance_type_map["prod"]
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id,aws_security_group.vpc-web.id ]
  for_each = toset(keys({ for az, details in data.aws_ec2_instance_type_offerings.my_ins_type :
  az => details.instance_types if length(details.instance_types) != 0 }))
  availability_zone = each.key
#   count = 2
  tags = {
     # name = "terraform-demo${count.index}"
      name = "terraform-demo-${each.key}"
  }
}