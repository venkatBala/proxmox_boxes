variable proxmox_url {
    type = string
    description = "URL to the proxmox server e.g http://<proxmox_ip>:<proxmox_port>/api2/json"
}

variable proxmox_username {
    type = string
    description = "Proxmox admin username"
}

variable proxmox_password {
    type = string
    description = "proxmox admin password"
}

variable proxmox_node {
    type = string
    description = 
}