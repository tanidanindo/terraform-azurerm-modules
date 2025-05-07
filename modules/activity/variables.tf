variable "name" {
  type        = string
  description = "The name of the activity log alert"
}

variable "rg_name" {
  type        = string
  description = "The name of the resource group in which to create the activity log alert instance"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource"
  default     = null
}

variable "scopes" {
  type        = list(string)
  description = "The Scope at which the Activity Log should be applied, for example a the Resource ID of a Subscription or a Resource."
}

variable "description" {
  type        = string
  description = "The description of this activity log alert."
}

variable "enabled" {
  type        = bool
  description = "Should this Activity Log Alert be enabled? Defaults to true."
  default     = true
}

variable "criteria_category" {
  type        = string
  description = "The category of the operation. Possible values are Administrative, Autoscale, Policy, Recommendation, ResourceHealth, Security and ServiceHealth."
  default     = "ServiceHealth"
}

variable "resource_type" {
  type        = string
  description = "The resource type monitored by the activity log alert."
  default     = null
}

variable "service_health_events" {
  type        = list(string)
  description = "Events this alert will monitor Possible values are Incident, Maintenance, Informational, ActionRequired and Security. Defaults to all Events"
  default     = null
}

variable "service_health_locations" {
  type        = list(string)
  description = "Locations this alert will monitor. For example, West Europe. Defaults to Global"
  default     = null
}

variable "service_health_services" {
  type        = list(string)
  description = "Services this alert will monitor. For example, Activity Logs & Alerts, Action Groups. Defaults to all Services."
  default     = null
}

variable "action_group_id" {
  type        = string
  description = "The ID of the Action Group can be sourced from the azurerm_monitor_action_group resource"
}

variable "location" {
  type = string
  description = "The Azure Region where the activity log alert rule should exist. Changing this forces a new resource to be created."
}

variable "operation_name" {
  type = string
  description = "The Resource Manager Role-Based Access Control operation name. Supported operation should be of the form: <resourceProvider>/<resourceType>/<operation>"
  default = null
}

variable "sev_level" {
  type = string
  description = "Filter on the severity level of the event. Possible values are 'Verbose', 'Informational', 'Warning', 'Error', and 'Critical'."
  default = null
}

variable "operation_status" {
  type = string
  description = "Filter on the status of the event. Possible values are 'Started', 'Failed', or 'Succeeded'."
  default = null
}