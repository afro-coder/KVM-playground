#version=DEVEL
# System authorization information
auth --enableshadow --passalgo=sha512
# Use CDROM installation media

# Use graphical install
text
# Run the Setup Agent on first boot
firstboot --enable
ignoredisk --only-use=vda
# Keyboard layouts
keyboard --vckeymap=us --xlayouts='us'
# System language
lang en_US.UTF-8
reboot
# Network information
network  --bootproto=dhcp --device=eth0 --ipv6=auto --activate
network  --hostname=centos7-automated

# Root password
rootpw --iscrypted $6$gG1r.QT9P3U0y0MI$KwDdmgVAg/WksGwJ5vUU.etxLaGI71fV3Q3W2imJpcCJD0unOneg/u7KuUnvGSY85vejUOLifrvwwrUKg4Xvo1
# System services
services --enabled="chronyd"
# System timezone
timezone Asia/Kolkata --isUtc
# X Window System configuration information
skipx
# System bootloader configuration
bootloader --append=" crashkernel=auto" --location=mbr --boot-drive=vda
# Partition clearing information
clearpart --none --initlabel
# Disk partitioning information
part /boot --fstype="xfs" --ondisk=vda --size=500
part pv.198 --fstype="lvmpv" --ondisk=vda --size=30219
volgroup centos --pesize=4096 pv.198
logvol swap  --fstype="swap" --size=4072 --name=swap --vgname=centos
logvol /home  --fstype="xfs" --size=5120 --name=home --vgname=centos
logvol /  --fstype="xfs" --size=21024 --name=root --vgname=centos

%packages
@base
@core
@development
@dial-up
@fonts
@guest-agents
@guest-desktop-agents
@hardware-monitoring
@input-methods
vim
tmux
chrony
kexec-tools

%end

%addon com_redhat_kdump --enable --reserve-mb='auto'

%end

%anaconda
pwpolicy root --minlen=6 --minquality=1 --notstrict --nochanges --notempty
pwpolicy user --minlen=6 --minquality=1 --notstrict --nochanges --emptyok
pwpolicy luks --minlen=6 --minquality=1 --notstrict --nochanges --notempty
%end
