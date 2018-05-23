resource "ibm_compute_vm_instance" "vm_test" {
    hostname = "vm-test-0001"
    domain = "example.net"
    datacenter = "seo01"
    flavor_key_name = "C1_1X1X25"
    os_reference_code = "UBUNTU_16_64"
    local_disk = false
    private_network_only = true
    notes = "test vm instance"
}
