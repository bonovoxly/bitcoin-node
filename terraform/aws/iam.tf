# node instance profile
resource "aws_iam_instance_profile" "node" {
  name = "${ var.env }-node-profile"
  role = "${ aws_iam_role.node.name }"
}


# node IAM role
resource "aws_iam_role" "node" {
  name               = "${ var.env }-node-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

