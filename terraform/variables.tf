variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "db_username" {
  default = "admin"
}

variable "db_password" {
  default = "password123"
}
