variable ssh_username {
  type = string
  default = "packer"
}

variable ssh_password {
  type = string
  default = "packer"
}

variable proxmox_url {
  type = string
}

variable proxmox_username {
  type = string
}

variable proxmox_password {
  type = string
}

variable proxmox_node {
  type = string
}

variable iso_file {
  type = string
}

variable iso_checksum {
  type = string
}

variable memory {
  type = number
  default = 4096
}

variable cores {
  type = number
  default = 2
}

variable sockets {
  type = number
  default = 1
}

variable cpu_type {
  type = string
  default = "host"
}

variable storage_pool {
  type = string
  default = "local-lvm"
}

variable storage_pool_type {
  type = string
  default = "lvm-thin"
}

variable os_disk_size {
  type = number
  default = 32
}
