# AWS Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = "${ aws_vpc.main.id }"
  tags {
    Name         = "${ var.env }-igw"
    terraform_id = "${ var.env }-terraform"
    Environment  = "${ var.env }"
  }
}

