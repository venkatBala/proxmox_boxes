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

# VM configuration options
variable insecure_skip_tls_verify {
    type = bool
    default = true
}

variable iso_file {
    type = string
}

variable iso_checksum {
    type = string
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
    default = "packer"
}

variable ssh_password {
    type = string
    default = "packer"
}

variable os_disk_size {
    type = string
    default = "32G"
}


# Gitlab runner configuration vars
variable runner_name {
    type = string
    description = "Gitlab runner name"
    default = "gitlabci"
}

variable runner_tags {
    type = string
    description = "Comma separated tag values for the specific runner"
    default = "amd64,linux,centos7.9"
}

variable registration_token {
    type = string
    description = "Gitlab runner registration token"
}

variable gitlab_instance_url {
    type = string
}

variable runner_executor_type {
    type = string
    default = "shell"
}