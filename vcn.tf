#create a vcn 
resource "oci_core_virtual_network" "vcn" {
  compartment_id = oci_identity_compartment.Terraformcompartment.id
  cidr_block     = var.vcn_cidr
  display_name   = var.vcn_dns_label
  dns_label      = var.vcn_dns_label
}

#create internet gateway
resource "oci_core_internet_gateway" "igw" {
  compartment_id = oci_identity_compartment.Terraformcompartment.id
  vcn_id         = oci_core_virtual_network.vcn.id
  display_name   = "igwTerraform"
}

#create route table
resource "oci_core_route_table" "rt" {
  compartment_id = oci_identity_compartment.Terraformcompartment.id
  vcn_id         = oci_core_virtual_network.vcn.id
  display_name   = "rtTerraform"

  route_rules {
    cidr_block        = "0.0.0.0/0"
    network_entity_id = oci_core_internet_gateway.igw.id
  }
}

#create a public subnet
resource "oci_core_subnet" "public_subnet" {
  cidr_block     = cidrsubnet(var.vcn_cidr, 8, 0)
  compartment_id = oci_identity_compartment.Terraformcompartment.id
  vcn_id         = oci_core_virtual_network.vcn.id
  display_name   = var.vcn_dns_label
  route_table_id = oci_core_route_table.rt.id
  dns_label      = var.vcn_dns_label
  security_list_ids = [
    oci_core_virtual_network.vcn.default_security_list_id
  ]
}

#create a security list
resource "oci_core_security_list" "sl" {
  compartment_id = oci_identity_compartment.Terraformcompartment.id
  vcn_id         = oci_core_virtual_network.vcn.id
  display_name   = "slTerraform"
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "all"
  }
  ingress_security_rules {
    source   = "0.0.0.0/0"
    protocol = "all"
  }
  ingress_security_rules {
    source   = "0.0.0.0/0"
    protocol = "6"
    tcp_options {
      max = 80
      min = 80
    }
  }
  ingress_security_rules {
    source   = "0.0.0.0/0"
    protocol = "6"
    tcp_options {
      max = 22
      min = 22
    }
  }
}

