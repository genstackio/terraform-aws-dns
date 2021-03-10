locals {
  statics = (null != var.statics_file) ? csvdecode(trimspace(file(var.statics_file))) : []
  entries = {for entry in local.statics : "${entry.type}-${entry.name}" => entry}
}