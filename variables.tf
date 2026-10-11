variable "core_cross_connect_groups" {
  description = <<EOT
Map of core_cross_connect_groups, attributes below
Required:
    - compartment_id
Optional:
    - customer_reference_name
    - defined_tags
    - display_name
    - freeform_tags
    - interface_down_timer_value_in_milliseconds
    - is_interface_hold_timer_enabled
    - is_qos_enabled
    - minimum_links
    - macsec_properties (block):
        - encryption_cipher (optional)
        - is_unprotected_traffic_allowed (optional)
        - primary_key (optional, block):
            - connectivity_association_key_secret_id (required)
            - connectivity_association_key_secret_version (optional)
            - connectivity_association_name_secret_id (required)
            - connectivity_association_name_secret_version (optional)
        - state (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    compartment_id                             = string
    customer_reference_name                    = optional(string)
    defined_tags                               = optional(map(string))
    display_name                               = optional(string)
    freeform_tags                              = optional(map(string))
    interface_down_timer_value_in_milliseconds = optional(number)
    is_interface_hold_timer_enabled            = optional(bool)
    is_qos_enabled                             = optional(bool)
    minimum_links                              = optional(number)
    macsec_properties = optional(object({
      encryption_cipher              = optional(string)
      is_unprotected_traffic_allowed = optional(bool)
      primary_key = optional(object({
        connectivity_association_key_secret_id       = string
        connectivity_association_key_secret_version  = optional(string)
        connectivity_association_name_secret_id      = string
        connectivity_association_name_secret_version = optional(string)
      }))
      state = string
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
}

