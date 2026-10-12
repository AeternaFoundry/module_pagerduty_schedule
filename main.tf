resource "pagerduty_schedule" "schedules" {
  for_each = var.schedules

  time_zone   = each.value.time_zone
  description = each.value.description
  name        = each.value.name
  overflow    = each.value.overflow
  teams       = each.value.teams

  dynamic "layer" {
    for_each = each.value.layer
    content {
      end  = layer.value.end
      name = layer.value.name
      dynamic "restriction" {
        for_each = layer.value.restriction != null ? layer.value.restriction : []
        content {
          duration_seconds  = restriction.value.duration_seconds
          start_day_of_week = restriction.value.start_day_of_week
          start_time_of_day = restriction.value.start_time_of_day
          type              = restriction.value.type
        }
      }
      rotation_turn_length_seconds = layer.value.rotation_turn_length_seconds
      rotation_virtual_start       = layer.value.rotation_virtual_start
      start                        = layer.value.start
      users                        = layer.value.users
    }
  }
}

