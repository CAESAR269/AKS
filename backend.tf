terraform {
  backend "azurerm" {
    resource_group_name  = "cloud-shell-storage-centralindia"
    storage_account_name = "terraform7"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}