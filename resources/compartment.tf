resource "oci_identity_compartment" "Terraformcompartment" {
    compartment_id = var.tenancy_ocid
    description = "Terraform compartment"
    name = "Terraformcompartment"
}