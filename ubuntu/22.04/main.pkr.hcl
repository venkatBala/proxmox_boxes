source proxmox-iso ubuntu {
  proxmox_url                 = var.proxmox_url
  username                    = var.proxmox_username
  password                    = var.proxmox_password
  node                        = var.proxmox_node
  insecure_skip_tls_verify    = true
  
      iso_file                    = var.iso_file
      iso_checksum                = var.iso_checksum
  
      memory                      = var.memory
      cores                       = var.cores
      sockets                     = var.sockets
      cpu_type                    = var.cpu_type
      os                          = "l26"
  
      network_adapters {
          bridge  = "vmbr0"
          model   = "virtio"
      }
  
      disks {
          storage_pool      = var.storage_pool
          storage_pool_type = var.storage_pool_type
          type              = "scsi"
          disk_size         = var.os_disk_size
          format            = "raw"
      }
      
      scsi_controller = "virtio-scsi-pci"
  
      qemu_agent    = true
      onboot        = false
  
      cloud_init    = true
      cloud_init_storage_pool = var.storage_pool
  
      http_directory = "./http"
      boot_command = [
        "e<down><down><down><end>",
        " autoinstall ds='nocloud-net;seedfrom=http://{{.HTTPIP}}:{{.HTTPPort}}/'",
        "<f10>"
    ]
  
      ssh_username = var.ssh_username
      ssh_password = var.ssh_password
     ssh_timeout = "20m"
}

source qemu ubuntu {
  #  iso_url = "file:///home/venkat/.cache/packer/d6c27ed78f385b7455c218ba93bf575d7bb4c89e.iso"
  ##  iso_url = "https://releases.ubuntu.com/jammy/ubuntu-22.04.2-live-server-amd64.iso"
  #iso_checksum = "sha256:5e38b55d57d94ff029719342357325ed3bda38fa80054f9330dc789cd2d43931"
  #output_directory = "output_ubuntu_test"
  #shutdown_command = "echo 'packer' | sudo -S shutdown -P now"
  disk_size = "5000M"
  format = "qcow2"
  accelerator = "kvm"
  http_directory = "http"
  ssh_username = "packer"
  ssh_password = "packer"
  ssh_timeout = "20m"
  vm_name = "test"
  net_device = "virtio-net"
  disk_interface = "virtio"
  boot_wait = "3s"
  use_default_display = true
  display = "none"
  qemuargs = [["-nographic"]]
  boot_command = [
        "<esc><wait>",
        "<esc><wait>",
        "<enter><wait>",
        "/install/vmlinuz<wait>",
        " initrd=/install/initrd.gz",
        " auto-install/enable=true",
        " debconf/priority=critical",
        " preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed.cfg<wait>",
        " -- <wait>",
        "<enter><wait>"
      ]
}
  
build {
  sources = ["source.proxmox-iso.ubuntu"]
}
