resource "vsphere_host_virtual_switch" "vSwitch-FE" {
  name           = "vSwitch-FE"
  host_system_id = "${data.vsphere_host.esxi-vsphere-dingo-nexus.id}"

  active_nics = []
  network_adapters = []

  allow_promiscuous      = true
  allow_forged_transmits = true
  allow_mac_changes      = true
}

resource "vsphere_host_virtual_switch" "vSwitch-RTRNET" {
  name           = "vSwitch-RTRNET"
  host_system_id = "${data.vsphere_host.esxi-vsphere-dingo-nexus.id}"
  
  mtu = 9000

  active_nics = []
  network_adapters = []

  link_discovery_protocol = "lldp"

  allow_promiscuous      = true
  allow_forged_transmits = true
  allow_mac_changes      = true
}

resource "vsphere_host_virtual_switch" "vSwitch-BE" {
  name           = "vSwitch-BE"
  host_system_id = "${data.vsphere_host.esxi-vsphere-dingo-nexus.id}"

  active_nics = []
  network_adapters = []

  link_discovery_protocol = "lldp"

  allow_promiscuous      = true
  allow_forged_transmits = true
  allow_mac_changes      = true
}

resource "vsphere_host_virtual_switch" "vSwitch-SAN" {
  name           = "vSwitch-SAN"
  host_system_id = "${data.vsphere_host.esxi-vsphere-dingo-nexus.id}"

  mtu = 9000

  active_nics = []
  network_adapters = []

  link_discovery_protocol = "lldp"

  allow_promiscuous      = true
  allow_forged_transmits = true
  allow_mac_changes      = true
}