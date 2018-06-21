terraform {
  required_version = ">= 0.11.1"
}

# Configure the Azure Provider
provider "azurerm" { 
  subscription_id = "c0a607b2-6372-4ef3-abdb-dbe52a7b56ba"
  client_id       = "c0a607b2-6372-4ef3-abdb-dbe52a7b56ba"
  tenant_id       = "0e3e2e88-8caf-41ca-b4da-e3b33b6c52ec"
}

# Create a resource group
  resource "azurerm_resource_group" "network" {
  name     = "ajennings_testing"
  location = "East US"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "network" {
  name                = "production-network"
  address_space       = ["10.0.0.0/16"]
  location            = "${azurerm_resource_group.network.location}"
  resource_group_name = "${azurerm_resource_group.network.name}"

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
  }

  subnet {
    name           = "subnet3"
    address_prefix = "10.0.3.0/24"
  }
}
