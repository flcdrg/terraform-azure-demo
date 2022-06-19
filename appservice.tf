resource "azurerm_service_plan" "plan" {
  name                = "plan-tfdemo-australiaeast"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_linux_web_app" "app" {
  name                = "app-tfdemo-australiaeast"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  service_plan_id     = azurerm_service_plan.plan.id

  https_only = true

  site_config {
    app_command_line = "dotnet WebApp.dll"
    http2_enabled    = true
  }

  connection_string {
    name  = "Database"
    type  = "SQLAzure"
    value = "Server=${azurerm_mssql_server.mssql.fully_qualified_domain_name};Database=${azurerm_mssql_database.database.name};User ID=${var.mssql_administrator_login};Password=${var.mssql_administrator_password};Application Name=App Service"
  }
}