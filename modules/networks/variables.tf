variable "resource_group_name" {

}

variable "location" {
  
}

variable "network_name" {
  
}

variable "network_cidr" {
  default = ["172.16.0.0/16"]
}

variable private_subnets {
  default = {
    "GatewaySubnet" = 0
    "default" = 1
  }
}