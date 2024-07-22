
//Variable para el nombre que usará Azure KeyVault
variable "keyvault_name" {
    type = string
}

//La Region que se usará en Azure
variable "location" {
    type = string
}

//El nombre del grupo de recursos en Azure
variable "resource_group_name" {
    type = string
}
