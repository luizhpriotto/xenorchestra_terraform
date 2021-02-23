### LOGIN ####
xo_url = "ws://192.168.1.152"
xo_username = "terraform"
xo_password = "terraform"
#####  VM ####
pool_name = "node1"
hostname = "master"
memory_max = 4294967296
#disk_size = 32212254720
#num_cpus = 2
source_template_family = "template-n"
associate_pool_network = "PRD"
vm_description = "Created by Terraform"
vm_tags = ["k8s","master"]
ip_config = "192.168.1.66"
ip_mac = "82:69:64:28:b4:3a"
