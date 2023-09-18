## Copyright © 2021, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

terraform {
  required_version = ">= 0.12.0"
}

provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}

provider "oci" {
  alias                = "homeregion"
  tenancy_ocid         = var.tenancy_ocid
  user_ocid            = var.user_ocid
  fingerprint          = var.fingerprint
  private_key_path     = var.private_key_path
  region               = data.oci_identity_region_subscriptions.home_region_subscriptions.region_subscriptions[0].region_name
  disable_auto_retries = "true"
}

provider "oci" {
  alias                = "targetregion"
  tenancy_ocid         = var.tenancy_ocid
  user_ocid            = var.user_ocid
  fingerprint          = var.fingerprint
  private_key_path     = var.private_key_path
  region               = var.region
  disable_auto_retries = "true"
}

# Variables required by the OCI Provider only when running Terraform CLI with standard user based Authentication
variable "user_ocid" { ocid1.user.oc1..aaaaaaaaedytf24fnrvlgu562epmhkc3t27dmtv5zrodnhjit6e3l2obujdq }
variable "fingerprint" { a7:b6:c9:77:72:c1:37:8d:4f:5d:a4:5d:3c:11:cf:61 }
variable "private_key_path" { /home }

