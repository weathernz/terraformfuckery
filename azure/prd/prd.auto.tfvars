environment_short = "prd"
environment_name  = "Production"
region_short      = "nzn"
location          = "newzealandnorth"

vnet_address_space = "10.0.0.0/16"
apps_subnet_prefix = "10.0.0.0/24"

common_tags = {
  HCPTest      = "ViaPullRequest"
  CreatedBy    = "simon.skill@inde.nz"
  CreationDate = "2026-11-05"
  Terraform    = "true"
}
