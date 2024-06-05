provider "vsphere" {
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "vsphere-dingo-nexus" {}

data "vsphere_host" "esxi-vsphere-dingo-nexus" {
  datacenter_id = data.vsphere_datacenter.vsphere-dingo-nexus.id
}

data "vsphere_datastore" "storage-vsphere-dingo-nexus" {
  datacenter_id = data.vsphere_datacenter.vsphere-dingo-nexus.id
}

data "vsphere_resource_pool" "pool-vsphere-dingo-nexus" {}