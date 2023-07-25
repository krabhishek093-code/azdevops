# Configure the Azure Provider
#provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
#  version = "=1.38.0"
#}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "azuretraining"
    storage_account_name = "tfstate2507"
    container_name = "tfstate"
    key = "state.tfstate"
 }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "java" {
  name     = "azdevops"
  location = "East US"
}

# Service Plan Creation 
resource "azurerm_app_service_plan" "javaserviceplan" {
  name                = "java-appserviceplan"
  location            = "${azurerm_resource_group.java.location}"
  resource_group_name = "${azurerm_resource_group.java.name}"
  kind                = "Linux"
  sku {
    tier = "Basic"
    size = "B1"
  }
}


# Creation of App service
resource "azurerm_app_service" "samplejava" {
  name                = "samplejava-app-service"
  location            = "${azurerm_resource_group.java.location}"
  resource_group_name = "${azurerm_resource_group.java.name}"
  app_service_plan_id = "${azurerm_app_service_plan.javaserviceplan.id}"
  https_only            = true
  site_config {
    minimum_tls_version = "1.2"
  }
}
