variable "vnet_name" {
}

variable "vnet_location" {
}

variable "rg_name" { 
}

variable "subnet_name" {
    default = ""
}

variable "create_subnet" {
  type = bool
}

variable "network_interface_name" {
  
}

variable "delegation" {
  description = "Delegation configuration"

}

variable "add_space" {
  
}

variable "subnet_prefix" {

}