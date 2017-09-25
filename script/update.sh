#!/bin/bash -eux
    echo "==> Applying updates"
    dnf -y update

    # reboot
    echo "Rebooting the machine..."
    reboot
    sleep 60
