# network.dingo.nexus

## Terraform

To create the CHR disks ahead of time, using Mikrotik's CHR image, versioned 7.15:

```
cd /vmfs/volumes/storage-vsphere.dingo.nexus/
wget --no-check-certificate https://download.mikrotik.com/routeros/7.15/chr-7.15.vmdk.zip
unzip chr-7.15.vmdk.zip
mkdir -p /vmfs/volumes/storage-vsphere.dingo.nexus/fe.core.network.dingo.nexus
mkdir -p /vmfs/volumes/storage-vsphere.dingo.nexus/be.core.network.dingo.nexus
vmkfstools -i chr-7.14.3.vmdk fe.core.network.dingo.nexus/fe.core.network.dingo.nexus.vmdk
vmkfstools -X 1G fe.core.network.dingo.nexus/fe.core.network.dingo.nexus.vmdk
vmkfstools -i chr-7.14.3.vmdk be.core.network.dingo.nexus/be.core.network.dingo.nexus.vmdk
vmkfstools -X 1G be.core.network.dingo.nexus/be.core.network.dingo.nexus.vmdk
```