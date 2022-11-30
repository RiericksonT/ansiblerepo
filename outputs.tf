output "name-of-first-availability-domain" {
  value = data.oci_identity_availability_domains.ads.availability_domains[0].name
}

output "instance_ipaddress" {
  value = oci_core_instance.ubuntu_instance.public_ip
}
