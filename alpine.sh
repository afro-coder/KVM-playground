#!/bin/bash

virt-install --connect qemu:///session \
        --name "Alpine" \
        --memory 1024 \
        --vcpus 2 \
        --cpu host \
        --cdrom="/home/leon/Leon/LinuxIso/alpine-virt-3.11.2-x86_64.iso" \
        --os-type linux \
        --os-variant "generic" \
        --disk "/home/leon/Leon/QemuVM/centmount/alpine",size=10,bus=virtio,format=qcow2 \
        --network bridge=virbr1,model=virtio \
        --graphics vnc \
        --noautoconsole \
        -v \

