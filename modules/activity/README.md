# Activity Alerts Module

This terraform module creates an Azure Monitor Activity Log Alert resource.

It takes in variables for the name, resource group name, scopes, description, enabled status, criteria category, resource type, service health events, locations, and services, as well as an action group ID. It also uses a local variable for the tags.

The alert will be enabled or disabled based on the value of the "enabled" variable, and will use the specified criteria and action group. The alert will also be tagged with the provided tags.

## Example

```hcl
module "rg_alerting" {
  source = "./modules/rg"

  location = var.location_code.aza1
  name     = "aza1-rg-alerting-svcx-svcdesk-nprd-01"

  tags = merge(
    local.tags,
    {
      application-name  = "shared-services",
      operations-team   = "itinfrastructureteam@aritzia.com",
      technical-area    = "dc-cloud",
      technical-contact = "nnorris@aritzia.com",
    }
  )
}

module "alert_service_health" {
  source  = "app.terraform.io/Aritzia-LP/alerts/azurerm//modules/activity"
  version = "0.1.0"

  name        = "aza1-alert-service-health-logging01"
  rg_name     = module.rg_alerting.name
  description = "Service Health Alert"

  scopes = [
    data.azurerm_subscription.current.id
  ]

  criteria_category        = "ServiceHealth"
  service_health_locations = [var.location_name.aza1, var.location_name.azb1]
  service_health_services  = ["Virtual Machines"]

  action_group_id = module.action_group.id

  tags = module.rg_alerting.tags
}
```
