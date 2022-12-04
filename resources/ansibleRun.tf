resource "null_resource" "run_docker_install" {
  depends_on = [
    oci_core_instance.ubuntu_instance
  ]
  provisioner "remote-exec" {

    inline = [
      "sudo apt update", "python3 --version", "echo Done!"
    ]
    connection {
      type        = "ssh"
      host        = oci_core_instance.ubuntu_instance.public_ip
      user        = "ubuntu"
      private_key = file(var.ssh_private_key_file)
      timeout     = "2m"
    }
  }

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ${oci_core_instance.ubuntu_instance.public_ip}, docker.yaml -u ubuntu "
  }

}
