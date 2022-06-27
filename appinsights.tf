resource "azurerm_application_insights" "appinsights" {
  name                = "appi-tfdemo-australiaeast"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  application_type    = "web"
}
