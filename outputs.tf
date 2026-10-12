output "schedules_id" {
  description = "Map of id values across all schedules, keyed the same as var.schedules except keys with no id are omitted"
  value       = { for k, v in pagerduty_schedule.schedules : k => v.id if v.id != null && length(v.id) > 0 }
}
output "schedules_description" {
  description = "Map of description values across all schedules, keyed the same as var.schedules except keys with no description are omitted"
  value       = { for k, v in pagerduty_schedule.schedules : k => v.description if v.description != null && length(v.description) > 0 }
}
output "schedules_final_schedule" {
  description = "Map of final_schedule values across all schedules, keyed the same as var.schedules except keys with no final_schedule are omitted"
  value       = { for k, v in pagerduty_schedule.schedules : k => v.final_schedule if v.final_schedule != null && length(v.final_schedule) > 0 }
}
output "schedules_layer" {
  description = "Map of layer values across all schedules, keyed the same as var.schedules except keys with no layer are omitted"
  value       = { for k, v in pagerduty_schedule.schedules : k => v.layer if v.layer != null && length(v.layer) > 0 }
}
output "schedules_name" {
  description = "Map of name values across all schedules, keyed the same as var.schedules except keys with no name are omitted"
  value       = { for k, v in pagerduty_schedule.schedules : k => v.name if v.name != null && length(v.name) > 0 }
}
output "schedules_overflow" {
  description = "Map of overflow values across all schedules, keyed the same as var.schedules except keys with no overflow are omitted"
  value       = { for k, v in pagerduty_schedule.schedules : k => v.overflow if v.overflow != null }
}
output "schedules_teams" {
  description = "Map of teams values across all schedules, keyed the same as var.schedules except keys with no teams are omitted"
  value       = { for k, v in pagerduty_schedule.schedules : k => v.teams if v.teams != null && length(v.teams) > 0 }
}
output "schedules_time_zone" {
  description = "Map of time_zone values across all schedules, keyed the same as var.schedules except keys with no time_zone are omitted"
  value       = { for k, v in pagerduty_schedule.schedules : k => v.time_zone if v.time_zone != null && length(v.time_zone) > 0 }
}

