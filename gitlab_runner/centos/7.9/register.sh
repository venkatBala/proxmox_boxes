#!/bin/bash

REGISTER="/usr/local/bin/gitlab-runner register \
            --non-interactive \
            --url ${var.gitlab_instance_url} \
            --registration_token ${var.registration_token} \
            --name ${var.runner_name} \
            --tag-list ${var.runner_tags} \
            --locked \
            --paused \
            --executor shell"