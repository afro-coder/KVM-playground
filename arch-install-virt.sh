#!/bin/bash

virt-install --connect qemu:///session \
	--name "arch-repo" \
	--memory 2048 \
        --os-variant "archlinux" \
	--vcpus 2 \
	--cpu host \
        --disk "$KVM_VOLS/archlinux-testbed.qcow2",size=40,bus=virtio,format=qcow2 \
	--cdrom="archlinux-2020.11.01-x86_64.is" \
        --noautoconsole \
        --console pty,target_type=serial \
       	--wait -1 \
	--os-type "linux" \
        --os-variant "archlinux" \
	--network bridge=virbr0,model=virtio \
	--graphics vnc\
