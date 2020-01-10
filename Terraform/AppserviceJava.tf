# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=1.38.0"
}
resource "azurerm_resource_group" "java" {
  name     = "javasample"
  location = "WestUS"
}



