data "oci_onesubscription_aggregated_computed_usages" "onesubscription_aggregated_computed_usages_lookup" {
  for_each = var.onesubscription_aggregated_computed_usages_lookup

  compartment_id  = each.value.compartment_id
  subscription_id = each.value.subscription_id
  time_from       = each.value.time_from
  time_to         = each.value.time_to
  grouping        = each.value.grouping
  parent_product  = each.value.parent_product

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

