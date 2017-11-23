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
  default = "f1-micro"
}

variable "project" {
  type    = "string"
  description = "The Google Cloud project ID. Example: bitcoin-node-186802"
}

variable "region" {
  type    = "string"
  default = "us-west1"
}

variable "region_zone" {
  type    = "string"
  default = "us-west1-a"
}
