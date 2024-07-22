output "config" {
    value = azurerm_kubernetes_cluster.aks-cluster.kube_config_raw
  
}

output "aks_id" {
  value = azurerm_kubernetes_cluster.aks.id
}