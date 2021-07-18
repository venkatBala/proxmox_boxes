build {
    sources = [
        "sources.proxmox-iso.gitlabrunner"
    ]

    provisioner "shell" {
        inline = [
            // Download the binary for your system
            "sudo curl -L --output /usr/local/bin/gitlab-runner https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64",
            // Give it permissions to execute
            "sudo chmod +x /usr/local/bin/gitlab-runner",
            // Create a GitLab CI user
            "sudo useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash",

            // Install and run as service
            "sudo /usr/local/bin/gitlab-runner install --user=gitlab-runner --working-directory=/home/gitlab-runner",
            "sudo /usr/local/bin/gitlab-runner start",
            # Register the runner
            "sudo /usr/local/bin/gitlab-runner register --non-interactive --url ${var.gitlab_instance_url} --registration-token ${var.registration_token} --name ${var.runner_name} --tag-list ${var.runner_tags} --executor shell"
        ]
    }
}