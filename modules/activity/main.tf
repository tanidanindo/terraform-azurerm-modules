## --------------------------------------
##  LOCAL VARIABLES
## --------------------------------------

locals {
  tags = var.tags
}

## --------------------------------------
##  ACTIVITY LOG ALERT
## --------------------------------------

resource "azurerm_monitor_activity_log_alert" "alert" {
  name                = var.name
  resource_group_name = var.rg_name
  location            = var.location
  scopes              = var.scopes
  description         = var.description
  enabled             = var.enabled

  criteria {
    category        = var.criteria_category
    resource_type   = var.resource_type
    operation_name  = var.operation_name
    status          = var.operation_status
    level           = var.sev_level

    dynamic "service_health" {
      for_each = var.criteria_category == "ServiceHealth" ? [1] : []

      content {
        events    = var.service_health_events
        locations = var.service_health_locations
        services  = var.service_health_services
      }
    }
  }

  action {
    action_group_id = var.action_group_id
  }

  tags = local.tags
}
