# Arch Linux

This repo exists for me to document things I learn while messing around with Arch Linux. It's mainly a resource for myself. It also contains my dot-files and config files. I should give credit to @LukeSmithXYZ as the inspiration to use Arch mainly came from him, and a lot of the packages and settings I use are also modified from his LARBS setup.

## Machine
| Parameter | Value |
| :---      | :---  |
| Make | Lenovo |
| Model | ThinkPad X1 Extreme (Gen 2) |
| CPU | Intel i7 9750H (6 Cores, 12MB Cache) |
| GPU | Nvidia GeForce GTX 1650 Max-Q (4GB GDDR5) |
| RAM | 32GB |
| Display | FHD Dolby Vision (500 nits) |

## Installation
Follow https://wiki.archlinux.org/index.php/installation_guide with the
following notes.

1. In BIOS set graphics to `Discrete Only`.
2. In BIOS set `Secure Boot` to `Off`.
3. Disk Partition Scheme:
    * Boot - 1st partition - 200MB
    * Swap - 2nd partition - RAM Size
    * Root - 3rd partition - 50GB (can be smaller)
    * Home - 4th partition - Remainder
4. Format boot, root, and home partitions with `mkfs.fat -F 32` (UEFI boot) and `mkfs.ext4` (root and home).
5. Initial packages I install with `pacstrap`:
    * base
    * linux
    * linux-firmware
    * base-devel
    * man-pages
    * man-db
    * texinfo
    * networkmanager
    * neovim
    * git
6. Install `efibootmgr` and `grub`
7. Run Grub installation for UEFI with `grub-install --efi-directory=/path/to/efi/partitiion --bootloader-id=GRUB`.

## Personal Setup
| Use  | Choice | Relevant Packages |
| :--- | :---   | :---              |
| Graphics Server | X | xorg-server, xorg-xbacklight, xorg-xinit, xorg-xinput, xorg-xrandr, xorg-xset, xorg-xsetroot |
| Compositing Manager | Picom | picom |
| Window Manager | bspwm | bspwm-rounded-corners |
| Networking | NetworkManager | networkmanager, network-manager-applet |
| AUR Manager | Yay | yay (git) |
| Power Manager | PowerTop | powertop |
| Hotkey Manager | sxhkd | sxhkd |
| Audio | Pulse | alsa-utils, pulseaudio, pulseaudio-alsa |
| Daemon Manager | Dmenu | dmenu |
| Graphics Drivers | Nvidia | nvidia, nvidia-settings, nvidia-utils, mesa |
| Terminal | Termite | termite |
| Shell | Z-Shell | zsh, zsh-completions, zsh-syntax-highlighting |
| Text Editor | Neovim | nvim, pynvim (pip) |
| Status Bar | PolyBar | polybar |
| Browser | Firefox | firefox |
| File Explorer | Ranger | ranger, ueberzug (pip) |
| PDF Viewer | Zathura | zathura, zathura-pdf-mupdf |
| Python Setup | N/A | ipython, python, python-pip |
| LaTeX | N/A | texlive-most |
| Miscellaneous | N/A | discord, dunst, maim, nerd-fonts-complete, sxiv, xcape, xclip |
