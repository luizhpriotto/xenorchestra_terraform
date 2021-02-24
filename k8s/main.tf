module "kube-master" {
  source  = "../modules/"
  source_template_family = "template-n"
  
  xo_url = "ws://192.168.1.152"
  xo_username = "terraform"
  xo_password = "terraform"
  
  associate_pool_network = "PRD"
  pool_name = "node1"
  ip_config = "192.168.1.20"
  hostname  = "master"
  storage  =   "Local storage"

  vm_tags = ["k8s","master"]
  memory_max = 4294967296

  disk_size = "42212254720"
  num_cpus = "4"
}

module "kube-worker" {
  source  = "../modules/"
  source_template_family = "template-n"
  
  xo_url = "ws://192.168.1.152"
  xo_username = "terraform"
  xo_password = "terraform"
  
  associate_pool_network = "PRD"
  pool_name = "node1"
  ip_config = "192.168.1.21"
  hostname  = "worker1"
  storage  =   "Local storage"

  vm_tags = ["k8s","worker"]
  memory_max = "2073733640"

  disk_size = "42212254720"
  num_cpus = "2"
}


