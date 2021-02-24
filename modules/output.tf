output cloudinit {
  value = "\n${data.template_file.cloudinit.rendered}"
}

#output cloudinit_network {
#  value = "\n${data.template_file.cloudinit_network.rendered}"
#}

