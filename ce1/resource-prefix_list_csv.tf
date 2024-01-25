#
# Define a data-source as a CSV
#
variable "prefix_list_data" {
  description = "Path to the CSV file containing prefix list data"
  default     = "prefix_list.csv"
}

#
# Ingest the data as a variable, specifying the data format
#
locals {
  prefix_list = csvdecode(file(var.prefix_list_data))
}

#
# Loop for each line of the CSV
# Dump each column/line into a variable
# Note the script in the ge/le lines which will disregard the ge/le if /32 is specified or the entry is null
#
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
