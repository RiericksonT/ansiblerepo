variable "tenancy_ocid" {
  description = "Tenancy OCID"
  default     = "ocid1.tenancy.oc1..aaaaaaaazv3wapnqqxhlnmtigfknedmrsho6u7xpt56o3mt2evrgepwuzv6q"
}

variable "user_ocid" {
  description = "User OCID"
  default     = "ocid1.user.oc1..aaaaaaaaktfo4tmeupxyg4koqjkksgvy453ycd4co4egeycedzrmsrju2taa"
}

variable "fingerprint" {
  description = "Fingerprint"
  default     = "4b:89:1c:1b:a9:29:84:23:a5:69:da:99:e9:94:ed:15"
}

variable "private_key_path" {
  description = "Private Key Path"
  default     = "C:/Users/rieri/Documents/ansible/keys/-11-30=18-10.pem"
}

variable "region" {
  description = "Region"
  default     = "sa-saopaulo-1"
}

variable "vcn_cidr" {
  description = "VCN CIDR"
  default     = "10.0.0.0/16"
}

variable "vcn_dns_label" {
  description = "VCN DNS Label"
  default     = "vcnterraform"
}

variable "ssh_public_key_file" {
  description = "SSH Public Key File"
  default     = "C:/Users/rieri/Documents/ansible/keys/keys.pub"
}

variable "ssh_private_key_file" {
  description = "SSH Private Key File"
  default     = "C:/Users/rieri/Documents/ansible/keys/keys.key"
}

variable "ssh_private_key_file_mega" {
  description = "SSH Private Key File"
  default     = "C:/Users/rieri/Documents/ansible/keys/megaHost.key"

}

variable "vault_password_file" {
  description = "Vault Password File"
  default     = "C:/Users/rieri/Documents/ansible/keys/pass.txt"
}

