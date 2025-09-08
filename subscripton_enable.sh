#!/bin/bash

# Register the system with Red Hat Subscription Management
subscription-manager register --username=<your-username> --password=<your-password>

# Attach the appropriate subscription
subscription-manager attach --auto

# Enable the "ansible" repository if it exists
for repo in $(yum repolist all | grep ansible); do
    repo_name=$(echo $repo | cut -d '-' -f 1)
    if [[ "$repo_name" == "ansible" ]]; then
        echo "Enabling repository: $repo"
        subscription-manager repos --enable=$repo
        break
    fi
done