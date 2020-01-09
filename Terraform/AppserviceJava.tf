# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=1.38.0"
}

resource "azurerm_resource_group" "java" {
  name     = "javasample"
  location = "WestUS"
}

resource "azurerm_app_service_plan" "java" {
  name                = "java-appserviceplan"
  location            = "${azurerm_resource_group.java.location}"
  resource_group_name = "${azurerm_resource_group.java.name}"
  kind                = "linux"
  reserved            = true
  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_app_service" "java" {
  name                = "java-app-service"
  location            = "${azurerm_resource_group.java.location}"
  resource_group_name = "${azurerm_resource_group.java.name}"
  app_service_plan_id = "${azurerm_app_service_plan.java.id}"

  site_config {
    java_version 
    java_container_version
    java_container
  }
}
