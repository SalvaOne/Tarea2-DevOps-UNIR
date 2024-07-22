variable "vm_name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "ssh_public_key" {
  default = "~/.ssh/ClaveRootAnsible.pub"
}