resource "azurerm_application_insights" "appinsights" {
  name                = "appi-tfdemo-australiaeast"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  application_type    = "web"
}

output "instrumentation_connection_string" {
  value = azurerm_application_insights.appinsights.connection_string
}

output "app_id" {
  value = azurerm_application_insights.appinsights.app_id
}