//Variables que se usarán a nivel global
variable "rgname" {
  type = string
  description = "Nombre del grupo de recurso para el proyecto"
  default = "rg-devops"
}

variable "location" {
  type = string
  description = "Region que usará el proyecto"
  default = "East US"
}

variable "keyvault_name" {
  type = string
}

variable "acr_name" {
  type = string
}

variable "aks_name" {
  type = string
}

variable "vm_name" {
  type = string
}

variable "example_secret_value" {
  type        = string
  description = "El secreto de Azure keyvault"
}

variable "ssh_public_key" {
  type        = string
}