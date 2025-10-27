# configurte Azure Provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

#configure the Azure Provider features
provider "azurerm" {    
  features {}
}

# Create a Resource Group
resource "azurerm_resource_group" "main" {

    name     = "rsgr-az1-testterraform"
    location = "Canada Central"
    tags = { 
    environnement = "lab"
        produit      = "TerraformForAzure"
        realisateur  = "jfgauthier"
        proprietaire   = "DPII"
    }
}

# Create a Virtual Network
resource "azurerm_virtual_network" "main" {
  name = "vnet-az1-testterraform"
  address_space = ["10.0.0.0/24"]
  location = "Canada Central"
  ressource_group_name = azurerm_resource_group.main.name
  tags = {
    environnement = "lab"
        produit      = "TerraformForAzure"
        realisateur  = "jfgauthier"
        proprietaire   = "DPII"
  }
}
