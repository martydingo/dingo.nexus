resource "vsphere_virtual_machine" "be-core-network-dingo-nexus" {
  name                       = "be.core.network.dingo.nexus"
  resource_pool_id           = data.vsphere_resource_pool.pool-vsphere-dingo-nexus.id
  datastore_id               = data.vsphere_datastore.storage-vsphere-dingo-nexus.id
  num_cpus                   = 48
  memory                     = 1024
  wait_for_guest_net_timeout = 0
  wait_for_guest_ip_timeout  = 0
  guest_id                   = "otherGuest64"
  alternate_guest_name       = "Mikrotik CHR"

  network_interface {
    network_id = data.vsphere_network.portGroup-RTRNET.id
  }
  network_interface {
    network_id = data.vsphere_network.portGroup-BE.id
  }

  disk {
    label        = "be.core.network.dingo.nexus"
    path         = "/be.core.network.dingo.nexus/be.core.network.dingo.nexus.vmdk"
    datastore_id = data.vsphere_datastore.storage-vsphere-dingo-nexus.id
    attach       = true
  }
}
