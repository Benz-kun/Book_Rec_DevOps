provider "azurerm" {
  features {}
  subscription_id = "253906c5-d694-47d4-bb2a-eeb173388991"
  resource_provider_registrations = true
}

resource "azurerm_resource_group" "rg" {
  name     = "bookapp-rg"
  location = "East US"
}

resource "azurerm_container_registry" "acr" {
  name                = "bookappacr123"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = true
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "bookapp-aks"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "bookapp"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }

  depends_on = [azurerm_container_registry.acr]
}
