terraform {
  required_version = "1.15.3"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.43.0"
    }
  }

  cloud {

    organization = "ContosoMarketing"

    workspaces {
      name = "Hands-on_with_terraform_azure"
    }
  }
}
provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "813-1ed7d541-hands-on-with-terraform-on-azure"
  location = "westus"
}

module "securestorage" {
  source               = "app.terraform.io/ContosoMarketing/securestorage/azurerm"
  version              = "1.0.0"
  resource_group_name  = "azurerm_resource_group.rg.name"
  location             = "azurerm_resource_group.rg.location"
  storage_account_name = "my-1st-st2rage-account-with-TF_GA"
}