
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
}

//Configuración del proveedor Azure para Terraform
provider "azurerm" {
  features {}
}

provider "random" {
  version = ">= 2.2.0"
}

//Grupo de recurso para Azure
resource "azurerm_resource_group" "rg1" {
  name     = var.rgname
  location = var.location
}


// Generar un valor aleatorio para el secreto
resource "random_password" "example" {
  length  = 16
  special = false
}

// Modulo para gestionar la creación y configuración de un ACR
module "acr" {
  source                = "./modules/acr"
  acr_name              = var.acr_name
  location              = var.location
  resource_group_name   = var.rgname
}

//Modulo para gestionar la creacion y configuración de un Keyvault
module "keyvault" {
  source                = "./modules/keyvault"
  keyvault_name         = var.keyvault_name
  location              = var.location
  resource_group_name   = var.rgname
}

// Creación de los secretos de Azure Key Vault
resource "azurerm_key_vault_secret" "example" {
  name         = "example-secret"
  value        = var.example_secret_value
  key_vault_id = module.keyvault.keyvault_id

  depends_on = [
    module.keyvault
  ]
}


//Modulo para la creación y configuración de Azure Kubernetes Service
module "aks" {
  source                 = "./modules/aks/"
  aks_name            = var.aks_name
  location               = var.location
  resource_group_name    = var.rgname

  depends_on = [
    module.keyvault
  ]

}

// Modulo para la creación y configuración de una VM
module "vm" {
  source              = "./modules/vm"
  vm_name             = var.vm_name
  location            = var.location
  resource_group_name = var.rgname

  depends_on = [
    module.keyvault
  ]
}

