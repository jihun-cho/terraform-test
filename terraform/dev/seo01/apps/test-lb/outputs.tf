output "lb_vip" {
  value = "${ibm_lbaas.lbaas.vip}"
}

output "private_subnet_id" {
  value = "${ibm_compute_vm_instance.vm_test.0.private_subnet_id}"
}
