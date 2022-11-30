data "oci_core_images" "images" {
  compartment_id           = oci_identity_compartment.Terraformcompartment.id
  operating_system         = "Canonical Ubuntu"
  operating_system_version = "18.04"
  shape                    = "VM.Standard2.1"
  sort_by                  = "TIMECREATED"
  sort_order               = "DESC"
}
