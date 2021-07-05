# Terraform Output Values
output "instance_publicip" {
  description = "EC2 Instance Public IP"
  value = aws_instance.myec2vm.public_ip
}

output "instance_publicdns" {
  description = "EC2 Instance Public DNS"
  value = aws_instance.myec2vm.public_dns
}

output "for_output_list" {
  description = "For Loop with List"
  value = [for instance in aws_instance.myec2vm: instance.public_dns]
}

output "for_output_map1" {
  description = "For Loop with Map"
  value = {for instance in aws_instance.myec2vm: instance.id => instance.public_dns}
}

output "for_output_map2" {
  description = "For Loop with Map - Advanced"
  value = {for c, instance in aws_instance.myec2vm: c => instance.public_dns}
}

output "legacy_splat_instance_publicdns" {
  description = "Legacy Splat Expression"
  value = aws_instance.myec2vm.*.public_dns
}  

output "latest_splat_instance_publicdns" {
  description = "Generalized Splat Expression"
  value = aws_instance.myec2vm[*].public_dns
}

output "instance_publicip" {
  description = "EC2 Instance Public IP"
  #value = aws_instance.myec2vm.*.public_ip   
  #value = aws_instance.myec2vm[*].public_ip  
  value = toset([
      for myec2vm in aws_instance.myec2vm : myec2vm.public_ip
    ])  
}

output "instance_publicdns" {
  description = "EC2 Instance Public DNS"
  #value = aws_instance.myec2vm[*].public_dns 
  #value = aws_instance.myec2vm[*].public_dns 
  value = toset([
      for myec2vm in aws_instance.myec2vm : myec2vm.public_dns
    ])    
}

output "instance_publicdns2" {
  value = tomap({
    for s, myec2vm in aws_instance.myec2vm : s => myec2vm.public_dns
    # S intends to be a subnet ID
  })
}

output "output_v3_2" {
  value = { for az, details in data.aws_ec2_instance_type_offerings.my_ins_type :
  az => details.instance_types if length(details.instance_types) != 0 }
}

output "output_v3_3" {
  value = keys({ for az, details in data.aws_ec2_instance_type_offerings.my_ins_type :
  az => details.instance_types if length(details.instance_types) != 0 }) 
}

output "output_v3_1" {
 value = { for az, details in data.aws_ec2_instance_type_offerings.my_ins_type :
  az => details.instance_types }   
}

output "output_v3_2" {
  value = { for az, details in data.aws_ec2_instance_type_offerings.my_ins_type :
  az => details.instance_types if length(details.instance_types) != 0 }
}

# This will return the list of availability zones supported for a instance type
output "output_v3_3" {
  value = keys({ for az, details in data.aws_ec2_instance_type_offerings.my_ins_type :
  az => details.instance_types if length(details.instance_types) != 0 }) 
}

# Filtered Output: As the output is list now, get the first item from list
output "output_v3_4" {
  value = keys({ for az, details in data.aws_ec2_instance_type_offerings.my_ins_type :
  az => details.instance_types if length(details.instance_types) != 0 })[0]
}
