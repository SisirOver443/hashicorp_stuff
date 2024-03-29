variable "resource_group_name" {
  type = string
  default = "prac-learn-consul-19"
}

variable "location" {
  default = "Australia Southeast"
}

variable "virtual_network_name" {
  type = string
  default = "prac-learn-consul-19-vnet"
}

variable "virtual_network_cidr" {
  default = [ "172.16.0.0/16" ]
}

variable "server_vm_name" {
  
}

variable "vm_server_size" {
  default = "Standard_D2s_v3"
}