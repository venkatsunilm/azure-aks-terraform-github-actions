variable "vmname" {
    type = string
    description = "name of the virtual machine"
}

variable "resource_group_name" {
    type = string
    description = "resource group name of the virtual network"
}

variable "location" {
    type = string
    description = "location of the virtual network"
}

variable "subnet_id" {
    type = string
    description = "id of the subnet"
}