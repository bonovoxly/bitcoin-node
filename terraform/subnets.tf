# node subnet a
resource "aws_subnet" "node-a" {
  vpc_id            ="${ aws_vpc.main.id }"
  cidr_block        = "${ var.cidr }.4.0/24"
  availability_zone = "${ var.region }a"

  tags {
    terraform_id = "${ var.env }-terraform"
    Name         = "${ var.env }-node-subnet-a"
    Environment  = "${ var.env }"
    Role         = "node"
    Zone         = "public"
  }
}

# node subnet b
resource "aws_subnet" "node-b" {
  vpc_id            ="${ aws_vpc.main.id }"
  cidr_block        = "${ var.cidr }.5.0/24"
  availability_zone = "${ var.region }b"

  tags {
    terraform_id = "${ var.env }-terraform"
    Name         = "${ var.env }-node-subnet-b"
    Environment  = "${ var.env }"
    Role         = "node"
    Zone         = "public"
  }
}

# node subnet c
resource "aws_subnet" "node-c" {
  vpc_id            ="${ aws_vpc.main.id }"
  cidr_block        = "${ var.cidr }.6.0/24"
  availability_zone = "${ var.region }c"

  tags {
    terraform_id = "${ var.env }-terraform"
    Name         = "${ var.env }-node-subnet-c"
    Environment  = "${ var.env }"
    Role         = "node"
    Zone         = "public"
  }
}

