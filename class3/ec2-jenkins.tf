# resource "aws_instance" "ec2_jenkins" {
#     ami  = lookup(var.ami_id, var.region)
#     instance_type = var.instance_type
#    vpc_security_group_ids = ["${aws_security_group.provisioner.id}"]

