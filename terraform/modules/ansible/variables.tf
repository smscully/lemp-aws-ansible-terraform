########################################
# Ansible Module Variables
########################################
# Ansible Inventory variables
variable "ansible_inventory_file" {
  type = string
}

variable "ansible_host_vars_path" {
  type = string
}

variable "key_pairs" {
  type = map(object({
    key_name   = string
    public_key = string
  }))
}

variable "instances" {
  type = map(object({
    ami                         = string
    instance_type               = string
    volume_size                 = number
    associate_public_ip_address = bool
    vpc_security_group_ids      = list(string)
    subnet_id                   = string
    key_name                    = string
    ssh_ip                      = string
    ssh_port                    = string
    domain_name                 = string
    certbot_email               = string
    db_server_type              = string
    web_server_type             = string
  }))
}

variable "instance_data" {
  type = map(map(string))
}
