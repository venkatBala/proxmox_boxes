build {
    sources = [
        "sources.proxmox-iso.centos"
    ]

    provisioner "shell" {
        inline = [
            "sudo yum install -y epel-release",
            "sudo yum update -y"
        ]
    }
}