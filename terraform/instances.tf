# node instance - subnet a
resource "aws_instance" "node-a" {
  ami = "${ data.aws_ami.ubuntu.id }"
  associate_public_ip_address = true
  count = "1"
  iam_instance_profile = "${ var.env }-node-profile"
  instance_type = "t2.micro"
  lifecycle {
    ignore_changes = ["ami"]
  }
  root_block_device {
    volume_type = "gp2"
    volume_size = "20"
  }
  key_name = "${ var.keypair }"
  private_ip = "${ cidrhost(aws_subnet.node-a.cidr_block, 10) }"
  subnet_id = "${ aws_subnet.node-a.id }"
  tenancy = "${ var.tenancy }"
  vpc_security_group_ids = ["${ aws_security_group.node.id }"]
  tags {
    Name = "${ var.env }-node-a-${ count.index }"
    terraform_id = "${ var.env }-terraform"
    Environment = "${ var.env }"
    Role = "node"
    sshUser = "ubuntu"
  }
}

## node instance - subnet b
#resource "aws_instance" "node-b" {
#  ami = "${ data.aws_ami.ubuntu.id }"
#  associate_public_ip_address = true
#  count = "1"
#  iam_instance_profile = "${ var.env }-node-profile"
#  instance_type = "t2.micro"
#  lifecycle {
#    ignore_changes = ["ami"]
#  }
#  root_block_device {
#    volume_type = "gp2"
#    volume_size = "20"
#  }
#  key_name = "${ var.keypair }"
#  private_ip = "${ cidrhost(aws_subnet.node-b.cidr_block, 10) }"
#  subnet_id = "${ aws_subnet.node-b.id }"
#  tenancy = "${ var.tenancy }"
#  vpc_security_group_ids = ["${ aws_security_group.node.id }"]
#  tags {
#    Name = "${ var.env }-node-b-${ count.index }"
#    terraform_id = "${ var.env }-terraform"
#    Environment = "${ var.env }"
#    Role = "node"
#    sshUser = "ubuntu"
#  }
#}
#
## node instance - subnet c
#resource "aws_instance" "node-c" {
#  ami = "${ data.aws_ami.ubuntu.id }"
#  associate_public_ip_address = true
#  count = "1"
#  iam_instance_profile = "${ var.env }-node-profile"
#  instance_type = "t2.micro"
#  lifecycle {
#    ignore_changes = ["ami"]
#  }
#  root_block_device {
#    volume_type = "gp2"
#    volume_size = "20"
#  }
#  key_name = "${ var.keypair }"
#  private_ip = "${ cidrhost(aws_subnet.node-c.cidr_block, 10) }"
#  subnet_id = "${ aws_subnet.node-c.id }"
#  tenancy = "${ var.tenancy }"
#  vpc_security_group_ids = ["${ aws_security_group.node.id }"]
#  tags {
#    Name = "${ var.env }-node-c-${ count.index }"
#    terraform_id = "${ var.env }-terraform"
#    Environment = "${ var.env }"
#    Role = "node"
#    sshUser = "ubuntu"
#  }
#}
