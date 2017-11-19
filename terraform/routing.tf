# public route
resource "aws_route_table" "public" {
  vpc_id = "${ aws_vpc.main.id }"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${ aws_internet_gateway.main.id }"
  }
  tags {
    Name         = "${ var.env }-public-route"
    terraform_id = "${ var.env }-terraform"
  }
}

# node-a association
resource "aws_route_table_association" "node-a" {
  subnet_id      = "${ aws_subnet.node-a.id }"
  route_table_id = "${ aws_route_table.public.id }"
}

# node-b association
resource "aws_route_table_association" "node-b" {
  subnet_id      = "${ aws_subnet.node-b.id }"
  route_table_id = "${ aws_route_table.public.id }"
}

# node-c association
resource "aws_route_table_association" "node-c" {
  subnet_id      = "${ aws_subnet.node-c.id }"
  route_table_id = "${ aws_route_table.public.id }"
}

