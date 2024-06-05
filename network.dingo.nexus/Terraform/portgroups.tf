resource "vsphere_host_port_group" "portGroup-FE" {
  name                = "portGroup-FE"
  host_system_id      = data.vsphere_host.esxi-vsphere-dingo-nexus.id
  virtual_switch_name = vsphere_host_virtual_switch.vSwitch-FE.name
  depends_on          = [vsphere_host_virtual_switch.vSwitch-FE]
}

data "vsphere_network" "portGroup-FE" {
  name          = "portGroup-FE"
  datacenter_id = data.vsphere_datacenter.vsphere-dingo-nexus.id
  depends_on    = [resource.vsphere_host_port_group.portGroup-FE]
}

resource "vsphere_host_port_group" "portGroup-RTRNET" {
  name                = "portGroup-RTRNET"
  host_system_id      = data.vsphere_host.esxi-vsphere-dingo-nexus.id
  virtual_switch_name = vsphere_host_virtual_switch.vSwitch-RTRNET.name
  depends_on          = [vsphere_host_virtual_switch.vSwitch-RTRNET]
}

data "vsphere_network" "portGroup-RTRNET" {
  name          = "portGroup-RTRNET"
  datacenter_id = data.vsphere_datacenter.vsphere-dingo-nexus.id
  depends_on    = [resource.vsphere_host_port_group.portGroup-RTRNET]
}

resource "vsphere_host_port_group" "portGroup-BE" {
  name                = "portGroup-BE"
  host_system_id      = data.vsphere_host.esxi-vsphere-dingo-nexus.id
  virtual_switch_name = vsphere_host_virtual_switch.vSwitch-BE.name
  depends_on          = [vsphere_host_virtual_switch.vSwitch-BE]
}

data "vsphere_network" "portGroup-BE" {
  name          = "portGroup-BE"
  datacenter_id = data.vsphere_datacenter.vsphere-dingo-nexus.id
  depends_on    = [resource.vsphere_host_port_group.portGroup-BE]
}

resource "vsphere_host_port_group" "portGroup-SAN" {
  name                = "portGroup-SAN"
  host_system_id      = data.vsphere_host.esxi-vsphere-dingo-nexus.id
  virtual_switch_name = vsphere_host_virtual_switch.vSwitch-SAN.name
  depends_on          = [vsphere_host_virtual_switch.vSwitch-SAN]
}

data "vsphere_network" "portGroup-SAN" {
  name          = "portGroup-SAN"
  datacenter_id = data.vsphere_datacenter.vsphere-dingo-nexus.id
  depends_on    = [resource.vsphere_host_port_group.portGroup-SAN]
}
