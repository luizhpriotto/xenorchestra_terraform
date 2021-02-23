#get a file to use as cloud config yaml
resource "xenorchestra_cloud_config" "vm" {
  name = "bootstrap"
  #could be write inside using EOF
  template = data.template_file.cloudinit.rendered
}

resource "xenorchestra_cloud_config" "vm_network" {
  name = "bootstrap"
  #could be write inside using EOF
  template = data.template_file.cloudinit_network.rendered
}

resource "xenorchestra_vm" "vm" {
  provider         = xenorchestra
 # count            = var.vms_count
  name_label       = var.hostname
  name_description = var.vm_description
  memory_max       = var.memory_max
  cpus             = var.num_cpus
  cloud_config     = xenorchestra_cloud_config.vm.template
  cloud_network_config = xenorchestra_cloud_config.vm_network.template
  template         = data.xenorchestra_template.template.id
  auto_poweron     = true
  network {
    network_id  = data.xenorchestra_network.net.id
    mac_address = var.ip_mac
  }

  disk {
    sr_id      = data.xenorchestra_sr.local_storage.id
    name_label = var.hostname
    size       = var.disk_size
  }

  tags = var.vm_tags
}

