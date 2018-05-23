######################################################
# variables for VLAN Data
######################################################
variable "valn_private_number" { default = "" }
variable "router_hostname" { default = "" }

######################################################
# variables for VM Instances
######################################################
variable "vm_count" { default = 2 }

variable "hostname" {
  type = "string"
  default = "vm-test"
  description = "Hostname of VM"
}

variable "domain" { default = "example.net" }

variable "datacenter" { default = "seo01" }

variable "flavor_key_name" { default = "C1_1X1X25" }

variable "os_reference_code" { default = "UBUNTU_16_64" }

variable "image_id" { default = "1937625" }

variable "local_disk" { default = false }

variable "private_network_only" { default = true }

variable "notes" { default = "test vm instance" }

######################################################
# variables for Security Groups
######################################################
variable "sg_ingress_port_min" { default = 8080 }

variable "sg_ingress_port_max" { default = 8080 }

######################################################
# variables for Load Balancer
######################################################
variable "lbaas_subnets" {
  type = "list"
  default = [] # Enter subnet id
  description = "subnets"
}

variable "lb_frontend_protocol" { default = "HTTP" }

variable "lb_frontend_port" { default = 80 }

variable "lb_backend_protocol" { default = "HTTP" }

variable "lb_backend_port" { default = 8080 }
