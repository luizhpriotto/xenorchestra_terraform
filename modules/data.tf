data "xenorchestra_pool" "pool" {
  name_label = var.pool_name
}

data "xenorchestra_sr" "local_storage" {
  name_label = var.storage
  pool_id    = data.xenorchestra_pool.pool.id
}

data "xenorchestra_template" "template" {
  name_label = var.source_template_family
  pool_id    = data.xenorchestra_pool.pool.id
}

data "xenorchestra_network" "net" {
  name_label = var.associate_pool_network
  pool_id    = data.xenorchestra_pool.pool.id
}

#Get the file to use in resource.

data "template_file" "cloudinit" {
  template = file("${path.module}/cloudinit_config.yaml")

  vars = {
    hostname = var.hostname
    ssh_key  = file("${path.module}/xoa_rsa.pub")
    ip_config = var.ip_config
  }
}

### NOT WORK
#data "template_file" "cloudinit_network" {
#  template = file("${path.module}/cloudinit_network_config.yaml")
#
#  vars = {
#    ip_config = var.ip_config
#    ip_mac    = var.ip_mac
#  }
#}

