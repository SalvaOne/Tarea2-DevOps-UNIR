
variable "aks_name" {
  type        = string
  description = "The name of the AKS cluster"
}

variable "location" {}

variable "resource_group_name" {}

variable "ssh_public_key" {
  default = "~/.ssh/ClaveRootAnsible.pub"
}

