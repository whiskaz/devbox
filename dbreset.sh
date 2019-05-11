#!/usr/bin/env bash
ansible-playbook /mnt/opt/projects/titandevbox/devbox.yml --extra-vars "dbreset=true" --tags "dbreset" $1