# Ansible Module

# Creates an Ansible inventory file with the IP address of each EC2 instance, an Ansible host_vars file for each instance, and an AWS EFS varibles file .

# This program is licensed under the terms of the GNU General Public License v3.0.

########################################
# Local Variables
########################################
locals {

  inventory_ips = tolist([
    for instance in var.instance_data : instance.public_ip
  ])

  # Concatenate public IPs to support Terraform local_file heredoc
  inventory_content = join("\n", local.inventory_ips)

}

########################################
# Create Ansible Inventory File
########################################
resource "local_file" "ansible_inventory_file" {

  content  = <<-EOF
    [web_servers]
    ${local.inventory_content}
    EOF
  filename = var.ansible_inventory_file

}

########################################
# Create Ansible host_vars template
########################################
data "template_file" "host_vars" {

  for_each = var.instances

  template = file("${path.module}/templates/host_vars.tftpl")

  vars = {
    instance_name    = each.key
    ansible_port     = each.value.ssh_port
    ansible_ssh_user = each.value.ami == "ubuntu_22" ? "ssh_ubuntu" : (each.value.ami == "amazon_linux_2023" ? "ssh_al" : null)
    private_key_file = trimsuffix(var.key_pairs[each.value.key_name].public_key, ".pub")
    domain_name      = each.value.domain_name
    acme_email       = each.value.certbot_email
    db_server_type   = each.value.db_server_type
    web_server_type  = each.value.web_server_type
  }

}

########################################
# Create Ansible host_vars Files
########################################
resource "local_file" "ansible_host_vars_file" {

  for_each = var.instances

  content  = data.template_file.host_vars[each.key].rendered
  filename = "${var.ansible_host_vars_path}/${var.instance_data[each.key].public_ip}"

}
