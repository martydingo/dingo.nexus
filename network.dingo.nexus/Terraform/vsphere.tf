variable "vsphere_server" {
  type = string
  sensitive = true
}

variable "vsphere_user" {
  type = string
  sensitive = true
}

variable "vsphere_password" {
  type = string
  sensitive = true
}

variable "vsphere_datastore" {
  type = string
  sensitive = false
}

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
  name = var.vsphere_datastore
  datacenter_id = data.vsphere_datacenter.vsphere-dingo-nexus.id
}

data "vsphere_resource_pool" "pool-vsphere-dingo-nexus" {}