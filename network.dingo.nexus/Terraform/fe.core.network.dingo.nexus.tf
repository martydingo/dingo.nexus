variable "public_ip_map" {
  type = list(object({
    ip  = string
    mac = string
  }))
}

resource "vsphere_virtual_machine" "fe-core-network-dingo-nexus" {
  name                       = "fe.core.network.dingo.nexus"
  resource_pool_id           = data.vsphere_resource_pool.pool-vsphere-dingo-nexus.id
  datastore_id               = data.vsphere_datastore.storage-vsphere-dingo-nexus.id
  num_cpus                   = 48
  memory                     = 1024
  wait_for_guest_net_timeout = 0
  wait_for_guest_ip_timeout  = 0
  guest_id                   = "otherGuest64"
  alternate_guest_name       = "Mikrotik Cloud Hosted Router"

  dynamic "network_interface" {
    for_each = var.public_ip_map
    content {
      network_id  = data.vsphere_network.portGroup-FE.id
      mac_address = network_interface.value["mac"]
    }
  }
  network_interface {
    network_id = data.vsphere_network.portGroup-RTRNET.id
  }

  disk {
    label        = "fe.core.network.dingo.nexus"
    path         = "/fe.core.network.dingo.nexus/fe.core.network.dingo.nexus.vmdk"
    datastore_id = data.vsphere_datastore.storage-vsphere-dingo-nexus.id
    attach       = true
  }
}
