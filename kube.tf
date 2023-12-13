resource "azurerm_resource_group" "kube" {
  name     = lookup(var.name, terraform.workspace)
  location = var.region
}
resource "azurerm_kubernetes_cluster" "kubecluster" {
  name                = var.clustername
  location            = azurerm_resource_group.kube.location
  resource_group_name = azurerm_resource_group.kube.name
  dns_prefix          = var.dns_prefix
  azure_policy_enabled = true
  default_node_pool {
    name       = var.pool_name
    node_count = lookup(var.node_count, terraform.workspace)
    vm_size    = var.vm_size
    enable_auto_scaling = true
    max_count = 3
    min_count = 1
    max_pods = 105
    os_sku = "Ubuntu"
    os_disk_size_gb = 128
    orchestrator_version = "1.27.7"
  }
  open_service_mesh_enabled = true
  identity {
    type = "SystemAssigned"
  }
}
