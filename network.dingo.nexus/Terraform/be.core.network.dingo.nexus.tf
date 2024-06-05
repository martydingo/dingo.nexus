# resource "vsphere_virtual_disk" "be-core-network-dingo-nexus" {
#   create_directories = true
#   datastore     = data.vsphere_datastore.storage-vsphere-dingo-nexus.name
#   size               = 1
#   vmdk_path          = "/dingo.nexus/network.dingo.nexus/core.network.dingo.nexus/be.core.network.dingo.nexus/be.core.network.dingo.nexus.vmdk"
# }

resource "vsphere_virtual_machine" "be-core-network-dingo-nexus" {
  name             = "be.core.network.dingo.nexus"
  resource_pool_id = data.vsphere_resource_pool.pool-vsphere-dingo-nexus.id
  datastore_id     = data.vsphere_datastore.storage-vsphere-dingo-nexus.id
  num_cpus         = 48
  memory           = 1024
  guest_id         = "other4xLinux64Guest"

  network_interface {
    network_id = data.vsphere_network.portGroup-RTRNET.id
  }
  network_interface {
    network_id = data.vsphere_network.portGroup-BE.id
  }

  disk {
    label = "be.core.network.dingo.nexus"
    size  = 1
    path = "/dingo.nexus/network.dingo.nexus/core.network.dingo.nexus/be.core.network.dingo.nexus/be.core.network.dingo.nexus.vmdk"
  }
}