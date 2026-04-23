terraform {
  required_version = "1.14.9"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43.0"
    }
  }

  cloud {

    organization = "snvprasad"

    workspaces {
      name = "Hands-On_With_Terraform_On_Azure"
    }
  }
}

provider "azurerm" {
  features {

  }

  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "813-3d9febb7-hands-on-with-terraform-on-azure"
  location = "South Central US "
}

module "securestorage" {
  source  = "app.terraform.io/snvprasad/securestorage/azurerm"
  version = "1.0.0"
  # insert required variables here
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "terraformsnv5326dbnsjk"
}