#!/bin/bash
set -ex

#if ! [$(pgrep qemu*)]
qemu-system-x86_64 -drive file=centos,format=raw -m 2G -enable-kvm -cpu host -smp 2 -netdev user,id=network0 -device e1000,netdev=network0,mac=52:54:00:12:34:56

