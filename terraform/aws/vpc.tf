resource "aws_vpc" "main" {
  cidr_block           = "${ var.cidr}.0.0/16"
  instance_tenancy     = "${ var.tenancy }"
  enable_dns_hostnames = "True"
  tags {
    Name        = "${var.env }-vpc"
    Environment = "${ var.env }"
  }
}
