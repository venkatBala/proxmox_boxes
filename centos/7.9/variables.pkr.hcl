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
}

variable insecure_skip_tls_verify {
    type = bool
    default = false
}

variable iso_file {
    type = string
}

variable iso_checksum {
    type = string
    default = "sha256:07b94e6b1a0b0260b94c83d6bb76b26bf7a310dc78d7a9c7432809fb9bc6194a"
}

variable memory {
    type = number
}

variable cores {
    type = number
}

variable sockets {
    type = number
    default = 1
}

variable cpu_type {
    type = string
    default = "host"
}

variable template_name {
    type = string
}

variable ssh_username {
    type = string
}

variable ssh_password {
    type = string
}

variable os_disk_size {
    type = string
    default = "32G"
}