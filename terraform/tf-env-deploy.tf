terraform {
    required_providers {
      azurerm = {
        source = "hashicorp/azurerm"
        version = "= 3.21.1"
      }
    }
}

provider "azurerm" {
    features {}
}
    
### Reference Hackday 2023
resource "azurerm_resource_group" "hackday_rg" {
    name      = var.resource_group_name
    location  = var.location
}


resource "azurerm_spring_cloud_service" "hackday_springservice"{
  name =  "${var.userid}_springservice"
  resource_group_name = azurerm_resource_group.hackday_rg.name
  location = azurerm_resource_group.hackday_rg.location
  depends_on = [azurerm_resource_group.hackday_rg]
}

resource "azurerm_spring_cloud_app" "hackday_springapp" {
  name = "${var.userid}_springapp"
  resource_group_name = azurerm_resource_group.hackday_rg.name
  location = azurerm_resource_group.hackday_rg.location
  depends_on = [azurerm_resource_group.hackday_rg]

}

/*
### Create Application Insights
resource "azurerm_application_insights" "hackday_common_insights" {
    name                = var.app_insights_name
    location            = azurerm_resource_group.hackday_rg.location
    resource_group_name = azurerm_resource_group.hackday_rg.name
    application_type    = "web"
    workspace_id        = "/subscriptions/${var.subscription}/resourceGroups/${var.vnetrg}/providers/Microsoft.OperationalInsights/workspaces/${var.sc_law_id}"
    depends_on = [azurerm_resource_group.hackday_rg]
}
    
### Create Spring Cloud Service
    resource "azurerm_spring_app_service" "spring-app" {
    name                = var.sa_service_name
    resource_group_name = var.resource_group_name
    location            = var.location
    sku_name            = "S0"
    
    network {
    app_subnet_id                   = "/subscriptions/${var.subscription}/resourceGroups/${var.azurespringappvnetrg/providers/Microsoft.Network/virtualNetworks/${var.vnet_spoke_name}/subnets/${var.app_subnet_id}"
    service_runtime_subnet_id       = "/subscriptions/${var.subscription}/resourceGroups/${var.azurespringappvnetrg}/providers/Microsoft.Network/virtualNetworks/${var.vnet_spoke_name}/subnets/${var.service_runtime_subnet_id}"
    cidr_ranges                     = var.sc_cidr
    }
    
    timeouts {
    create = "60m"
    delete = "2h"
    }
    
    depends_on = [azurerm_resource_group.sc_corp_rg]
    tags = var.tags
  
  }
    
    ### Update Diags setting for Spring Cloud Service
    
    resource "azurerm_monitor_diagnostic_setting" "sc_diag" {
    name                        = "monitoring"
    target_resource_id          = azurerm_spring_cloud_service.sc.id
    log_analytics_workspace_id = "/subscriptions/${var.subscription}/resourceGroups/${var.azurespringcloudvnetrg}/providers/Microsoft.OperationalInsights/workspaces/${var.sc_law_id}"
    
    log {
    category = "ApplicationConsole"
    enabled  = true

    retention_policy {
    enabled = false
    }
    }
    
    metric {
    category = "AllMetrics"

    retention_policy {
    enabled = false
    }
    }
  }
*/