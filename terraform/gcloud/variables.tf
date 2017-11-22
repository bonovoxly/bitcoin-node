# Gcloud Settings

# variable to identify environment
variable "env" {
  type    = "string"
  default = "bitcoin"
}

# VPC/subnet first two octet CIDR to use
variable "cidr" {
 type    = "string"
 default = "10.252"
}

# Instance type to use 
variable "type" {
  type    = "string"
  default = "t2.micro"
}

variable "project_name" {
  description = "The ID of the Google Cloud project"
}

variable "region" {
  default = "us-west1"
}

variable "region_zone" {
  default = "us-west1-a"
}

}
