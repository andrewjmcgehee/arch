# Arch Linux

This repo exists for me to document things I learn while messing around with Arch Linux. It's mainly a resource for myself. It will also probably contain my dot-files and config files once I get my Arch installation setup the way I like it.

## Machine
| Parameter | Value |
| :---      | :---  |
| Make | Lenovo |
| Model | ThinkPad x220 |
| CPU | Intel i5 2520M 2.50 Ghz (Dual Core)|
| RAM | 8GB |
| Graphics | Intel 2nd Generation Core Processor Family Integrated Graphics (rev 09) |

## Installation
Simple enough.

1. Boot into ISO and consequently Arch
2. Verify the boot mode. If `ls /sys/firmware/efi/efivars` returns any results, then boot mode is UEFI. Otherwise, traditional BIOS can be used.
3. Connect to internet (via ethernet is easiest). Test with `ping`.
4. Update system clock with `timedatectl set-ntp true`.
5. Partition disks (hardest part) with `fdisk /dev/sdX` where X is disk's assigned letter. In my case:
    * Boot - 1st partition - 200MB
    * Swap - 2nd partition - 1.5 x RAM (12GB)
    * Root - 3rd partition - 32GB (can be smaller)
    * Home - 4th partition - the rest
6. Format boot, root, and home partitions with `mkfs.ext4`.
7. Format swap partition with `mkswap /dev/sdX2` and `swapon /dev/sdX2` where X is disk's assigned letter.
8. Mount:
    * Mount root with `mount /dev/sdX3 /mnt`
    * Make boot dir with `mkdir /mnt/boot`
    * Mount boot with `mount /dev/sdX1 /mnt/boot`
    * Make home dir with `mkdir /mnt/home`
    * Mount home with `mount /dev/sdX4 /mnt/home`
9. (Optional) Organize mirrors by locale closest to you in `/etc/pacman.d/mirrorlist`. 
10. Select packages you wish to install and install base packages with `pacstrap /mnt base linux linux-firmware ...`. Here I also install `neovim base-devel man-pages man-db texinfo networkmanager network-manager-applet` to have a text editor, manual pages, and a network manager after install. 
11. Create FS Tab with `genfstab -U /mnt >> /mnt/etc/fstab`.
12. Chroot into system with `arch-chroot /mnt`.
13. Set time zone info with `ln -s /usr/share/zoneinfo/<region>/<city> /etc/localtime` and `hwclock --systohc`.
14. Set locale by uncommenting appropriate lines in `/etc/locale.gen` and running `locale-gen`.
15. Create locale config with `echo "LANG=<language_code> >> /etc/locale.conf`.
16. Add hostname for networking in `/etc/hostname`.
17. Add appropriate entries to `/etc/hosts`.
18. Create root password with `passwd`.
19. Install grub with `pacman -S grub` and `grub-install --target=i386-pc /dev/sdX`.
20. Configure grub with `grub-mkconfig -o /boot/grub/grub.cfg`.
21. Unmount and reboot with `umount -R /mnt` and `reboot`. Don't forget to remove your ISO.

## Configuration

### Tiling Window Manager - bspwm
Install `xorg-server xorg-xinit bspwm sxhkd` and put `exec bspwm` in `~/.xinitrc`. The packages with `xorg` manage the X graphical server, and `sxhkd` allows you to set keyboard shutcuts for bspwm. 

### Show Dot-files First in `ls`
Export the environment variable `LC_COLLATE=C`

### Natural Scrolling & Two-finger Right Click on Trackpad
Add this to `/etc/X11/xorg.conf.d/30-touchpad.conf`
```
Section "InputClass"
	Identifier "SynPS/2 Synaptics TouchPad"
	Driver "libinput"
	Option "ClickMethod" "clickfinger"
	Option "NaturalScrolling" "true"
EndSection
```
