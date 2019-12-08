# Arch Linux

This repo exists for me to document things I learn while messing around with Arch Linux. It's mainly a resource for myself.

## Machine
| Parameter | Value |
| :---      | :---  |
| Make | Lenovo |
| Model | ThinkPad x220 |
| CPU | Intel i5 2520M 2.50 Ghz |
| RAM | 8GB |
| Graphics | Intel 2nd Generation Core Processor Family Integrated Graphics (rev 09) |

## Installation
Simple enough.

1. Boot into ISO and select Install
2. Verify the boot mode. If `ls /sys/firmware/efi/efivars` returns any results, then boot mode is UEFI. Otherwise, traditional BIOS can be used.
3. Connect to internet (via ethernet is easiest). Test with `ping`.
4. Update system clock with `timedatectl set-ntp true`.
5. Partition disks (hardest part) with `fdisk`. In my case:
    * Boot partition - 200MB
    * Swap partition - 1.5 x RAM (12GB)
    * Root partition - 32GB (can be smaller)
    * Home partition - the rest
6. Format boot, root, and home partitions with `mkfs.ext4`.
7. Format swap partition with `mkswap /dev/sdX2` and `swapon /dev/sdX2` where X is disk's assigned letter.
8. Mount:
    * Mount root with `mount /dev/sdX3 /mnt`
    * Make boot dir with `mkdir /mnt/boot`
    * Mount boot with `mount /dev/sdX1 /mnt/boot`
    * Make home dir with `mkdir /mnt/home`
    * Mount home with `mount /dev/sdX4 /mnt/home`
9. Select packages you wish to install and install base packages with `pacstrap /mnt base linux linux-firmware ...`
10. Create FS Tab with `genfstab -U /mnt >> /mnt/etc/fstab`.
11. Chroot into system with `arch-chroot /mnt`.
12. Set time zone info with `ln -s /usr/share/zoneinfo/<region>/<city> /etc/localtime` and `hwclock --systohc`.
13. Set locale by uncommenting appropriate lines in `/etc/locale.gen` and running `locale-gen`.
14. Create locale config with `echo "LANG=<language_code> >> /etc/locale.conf`.
15. Add hostname for networking in `/etc/hostname`.
16. Add appropriate entries to `/etc/hosts`.
17. Create root password with `passwd`.
18. Install grub with `pacman -S grub` and `grub-install --target=i386-pc /dev/sdX`.
19. Configure grub with `grub-mkconfig -o /boot/grub/grub.cfg`.
20. Unmount and reboot with `umount -R /mnt` and `reboot`.

## Configuration

### i3
Must install `xorg-server xorg-xinit i3-gaps i3status` and put `exec i3` in `~/.xinitrc`

### Show dot files first in `ls`
Must export the environment variable `LC_COLLATE="C"`

### Natural Scrolling

