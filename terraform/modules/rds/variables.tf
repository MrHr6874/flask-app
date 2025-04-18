# terraform/modules/rds/variables.tf
variable "private_subnet_ids" {
  type = list(string)
}

variable "db_identifier" {
  type = string
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type = string
}

variable "db_name" {
  type = string
}

variable "security_group_id" {
  type = string
}


variable "vpc_id" {
  type = string
}
