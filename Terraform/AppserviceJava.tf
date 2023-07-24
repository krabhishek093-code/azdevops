# Configure the Azure Provider
#provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
#  version = "=1.38.0"
#}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "java" {
  name     = "azuretraining"
  location = "East US"
}

# Service Plan Creation 
resource "azurerm_app_service_plan" "javaserviceplan" {
  name                = "java-appserviceplan"
  location            = "${azurerm_resource_group.java.location}"
  resource_group_name = "${azurerm_resource_group.java.name}"
  kind                = "Linux"
  reserved            = true
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

  site_config {
    java_container = "JAVA"
    java_container_version ="11"
    use_32_bit_worker_process = false

  }
}
