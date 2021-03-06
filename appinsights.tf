resource "azurerm_log_analytics_workspace" "la" {
  name                = "log-tfdemo-australiaeast"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Free"
}

resource "azurerm_application_insights" "appinsights" {
  name                = "appi-tfdemo-australiaeast"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  application_type    = "web"
  workspace_id        = azurerm_log_analytics_workspace.la.id
}
