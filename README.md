# Proxmox Boxes
Simple packer HCL2 templates for building Proxmox virtual machine templates

## Building the boxes

### Requirements

* A [Proxmox](https://www.proxmox.com/en/) node to build boxes against
* [Packer](https://www.packer.io/)

To build a proxmox box, the proxmox node auth credentials must be provided to packer e.g
```
cd centos/7.9
packer build \
    -var "proxmox_url=<URL>" \
    -var "proxmox_username=<username>" \
    -var "proxmox_password=<password>" \
    -var "proxmox_node=<nodename>" .
```