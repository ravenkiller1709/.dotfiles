#!/bin/bash

ln -sf /usr/share/zoneinfo/Europe/Copenhagen /etc/localtime
hwclock --systohc
sed -i '123s/.//' /etc/locale.gen
locale-gen
echo "LANG=da_DK.UTF-8" >> /etc/locale.conf
echo "KEYMAP=dk-latin1" >> /etc/vconsole.conf
echo "Arch" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 Arch.localdomain Arch" >> /etc/hosts
echo root:password | chpasswd

# You can add xorg to the installation packages, I usually add it at the DE or WM install script
# You can remove the tlp package if you are installing on a desktop or vm

pacman -S grub grub-btrfs efibootmgr networkmanager network-manager-applet dialog wpa_supplicant mtools dosfstools reflector base-devel linux-headers avahi xdg-user-dirs xdg-utils gvfs gvfs-smb nfs-utils inetutils dnsutils bluez bluez-utils cups hplip alsa-utils pulseaudio pulseaudio-alsa pulseaudio-bluetooth bluez bluez-utils bash-completion openssh rsync reflector acpi acpi_call tlp virt-manager qemu qemu-arch-extra edk2-ovmf bridge-utils dnsmasq vde2 openbsd-netcat ipset ebtables iptables firewalld flatpak sof-firmware nss-mdns acpid os-prober ntfs-3g terminus-font xf86-video-intel xorg xorg-apps xorg-xinit xorg-server feh dunst calibre zsh zsh-autosuggestions zsh-syntax-highlighting fish alacritty

#Intel graphics
pacman -S --noconfirm intel-media-driver intel-gpu-tools

# pacman -S --noconfirm xf86-video-amdgpu mesa-vdpau radeontop
# pacman -S --noconfirm nvidia nvidia-utils nvidia-settings

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable cups.service
systemctl enable sshd
systemctl enable avahi-daemon
systemctl enable tlp # You can comment this command out if you didn't install tlp, see above
systemctl enable reflector.timer
systemctl enable fstrim.timer
systemctl enable libvirtd
systemctl enable firewalld
systemctl enable acpid

useradd -m kim
echo kim:password | chpasswd
usermod -aG libvirt kim

echo "kim ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/kim


printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"




