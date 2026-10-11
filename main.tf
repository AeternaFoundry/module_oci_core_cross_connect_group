resource "oci_core_cross_connect_group" "core_cross_connect_groups" {
  for_each = var.core_cross_connect_groups

  compartment_id                             = each.value.compartment_id
  customer_reference_name                    = each.value.customer_reference_name
  defined_tags                               = each.value.defined_tags
  display_name                               = each.value.display_name
  freeform_tags                              = each.value.freeform_tags
  interface_down_timer_value_in_milliseconds = each.value.interface_down_timer_value_in_milliseconds
  is_interface_hold_timer_enabled            = each.value.is_interface_hold_timer_enabled
  is_qos_enabled                             = each.value.is_qos_enabled
  minimum_links                              = each.value.minimum_links

  dynamic "macsec_properties" {
    for_each = each.value.macsec_properties != null ? [each.value.macsec_properties] : []
    content {
      encryption_cipher              = macsec_properties.value.encryption_cipher
      is_unprotected_traffic_allowed = macsec_properties.value.is_unprotected_traffic_allowed
      dynamic "primary_key" {
        for_each = macsec_properties.value.primary_key != null ? [macsec_properties.value.primary_key] : []
        content {
          connectivity_association_key_secret_id       = primary_key.value.connectivity_association_key_secret_id
          connectivity_association_key_secret_version  = primary_key.value.connectivity_association_key_secret_version
          connectivity_association_name_secret_id      = primary_key.value.connectivity_association_name_secret_id
          connectivity_association_name_secret_version = primary_key.value.connectivity_association_name_secret_version
        }
      }
      state = macsec_properties.value.state
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

