source proxmox-iso gitlabrunner {
    proxmox_url                 = var.proxmox_url
    username                    = var.proxmox_username
    password                    = var.proxmox_password
    node                        = var.proxmox_node
    insecure_skip_tls_verify    = var.insecure_skip_tls_verify

    iso_file                    = var.iso_file
    iso_checksum                = var.iso_checksum

    memory                      = var.memory
    cores                       = var.cores
    sockets                     = var.sockets
    cpu_type                    = var.cpu_type
    os                          = "l26"

    network_adapters {
        bridge = "vmbr0"
        model = "virtio"
    }

    disks {
        storage_pool = "local-lvm"
        storage_pool_type = "lvm"
        type        = "scsi"
        disk_size   = var.os_disk_size
    }
    
    scsi_controller = "virtio-scsi-pci"

    template_name = var.template_name
    qemu_agent    = true
    onboot        = false

    cloud_init    = true
    cloud_init_storage_pool = "local-lvm"

    http_directory = "./http"
    boot_command = [
        "<up><wait><tab> inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg<enter><wait>"
    ]

    ssh_username = var.ssh_username
    ssh_password = var.ssh_password
    ssh_timeout = "20m"
}