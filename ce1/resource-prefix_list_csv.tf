variable "prefix_list_data" {
  description = "Path to the CSV file containing prefix list data"
  default     = "prefix_list.csv"
}

locals {
  prefix_list = csvdecode(file(var.prefix_list_data))
}

resource "iosxe_prefix_list" "csv_prefix_lists" {
  count = length(local.prefix_list)

  prefixes = [
    {
      name   = local.prefix_list[count.index].name
      seq    = local.prefix_list[count.index].seq
      action = local.prefix_list[count.index].action
      ip     = local.prefix_list[count.index].ip
      ge     = local.prefix_list[count.index].ip == "/32" ? null : local.prefix_list[count.index].ge != "" ? local.prefix_list[count.index].ge : null
      le     = local.prefix_list[count.index].ip == "/32" ? null : local.prefix_list[count.index].le != "" ? local.prefix_list[count.index].le : null
    }
  ]
}
