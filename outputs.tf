output "schedules_id" {
  description = "Map of id values across all schedules, keyed the same as var.schedules"
  value       = { for k, v in pagerduty_schedule.schedules : k => v.id }
}
output "schedules_description" {
  description = "Map of description values across all schedules, keyed the same as var.schedules"
  value       = { for k, v in pagerduty_schedule.schedules : k => v.description }
}
output "schedules_final_schedule" {
  description = "Map of final_schedule values across all schedules, keyed the same as var.schedules"
  value       = { for k, v in pagerduty_schedule.schedules : k => v.final_schedule }
}
output "schedules_layer" {
  description = "Map of layer values across all schedules, keyed the same as var.schedules"
  value       = { for k, v in pagerduty_schedule.schedules : k => v.layer }
}
output "schedules_name" {
  description = "Map of name values across all schedules, keyed the same as var.schedules"
  value       = { for k, v in pagerduty_schedule.schedules : k => v.name }
}
output "schedules_overflow" {
  description = "Map of overflow values across all schedules, keyed the same as var.schedules"
  value       = { for k, v in pagerduty_schedule.schedules : k => v.overflow }
}
output "schedules_teams" {
  description = "Map of teams values across all schedules, keyed the same as var.schedules"
  value       = { for k, v in pagerduty_schedule.schedules : k => v.teams }
}
output "schedules_time_zone" {
  description = "Map of time_zone values across all schedules, keyed the same as var.schedules"
  value       = { for k, v in pagerduty_schedule.schedules : k => v.time_zone }
}

