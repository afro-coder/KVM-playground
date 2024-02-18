#!/bin/bash
# add script for new installation
virt-install --connect qemu+ssh://root@192.168.31.4/system \
       	--virt-type kvm \
       	--name archlinux-cloudbox \
       	--cpu host \
	--vcpus 2 \
       	--disk /home/leon/archlinux-cloud.qcow2 \
	--boot hd \
	--os-variant "archlinux" \
       	--graphics vnc \
	--memory 2048 \
	--network bridge=virbr0,model=virtio \
	--noautoconsole \
	--console pty,target_type=virtio \
