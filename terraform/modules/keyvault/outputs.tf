
//Es el id del recurso de Azure Keyvault
output "keyvault_id" {
    value = azurerm_key_vault.kv.id
}