module "demo" {
  # source = "git@github.com:~~~/demo?ref=0.1.0"
  source = "" # Enter path of a module

  vm_count = 2
  hostname = "vm-test"
  domain = "example.net"
  datacenter = "seo01"
  flavor_key_name = "C1_1X1X25"
  os_reference_code = "UBUNTU_16_64"
  local_disk = false
  private_network_only = true
  notes = "test vm instance"
  sg_ingress_port_min = 8080
  sg_ingress_port_max = 8080
  lbaas_subnets = [] # Enter subnet id
  lb_frontend_protocol = "HTTP"
  lb_frontend_port = 80
  lb_backend_protocol = "HTTP"
  lb_backend_port = 8080
}
