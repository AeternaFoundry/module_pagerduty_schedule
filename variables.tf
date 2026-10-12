variable "schedules" {
  description = <<EOT
Map of schedules, attributes below
Required:
    - time_zone
    - layer (block):
        - end (optional)
        - name (optional)
        - restriction (optional, block):
            - duration_seconds (required)
            - start_day_of_week (optional)
            - start_time_of_day (required)
            - type (required)
        - rotation_turn_length_seconds (required)
        - rotation_virtual_start (required)
        - start (required)
        - users (required)
Optional:
    - description
    - name
    - overflow
    - teams
EOT

  type = map(object({
    time_zone   = string
    description = optional(string)
    name        = optional(string)
    overflow    = optional(bool)
    teams       = optional(list(string))
    layer = list(object({
      end  = optional(string)
      name = optional(string)
      restriction = optional(list(object({
        duration_seconds  = number
        start_day_of_week = optional(number)
        start_time_of_day = string
        type              = string
      })))
      rotation_turn_length_seconds = number
      rotation_virtual_start       = string
      start                        = string
      users                        = list(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.schedules : (
        length(v.layer) >= 1
      )
    ])
    error_message = "Each layer list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.schedules : (
        alltrue([for item in v.layer : (item.rotation_turn_length_seconds >= 3600 && item.rotation_turn_length_seconds <= 31536000)])
      )
    ])
    error_message = "must be between 3600 and 31536000"
  }
  validation {
    condition = alltrue([
      for k, v in var.schedules : (
        alltrue([for item in v.layer : (item.restriction == null || alltrue([for item in item.restriction : (can(regex("([0-1][0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]", item.start_time_of_day)))]))])
      )
    ])
    error_message = "must be of 00:00:00 format"
  }
  validation {
    condition = alltrue([
      for k, v in var.schedules : (
        alltrue([for item in v.layer : (item.restriction == null || alltrue([for item in item.restriction : (item.start_day_of_week == null || (item.start_day_of_week >= 0 && item.start_day_of_week <= 7))]))])
      )
    ])
    error_message = "must be between 0 and 7"
  }
  validation {
    condition = alltrue([
      for k, v in var.schedules : (
        alltrue([for item in v.layer : (item.restriction == null || alltrue([for item in item.restriction : (item.duration_seconds >= 1 && item.duration_seconds <= 604799)]))])
      )
    ])
    error_message = "must be between 1 and 604799"
  }
  # Note: 6 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

