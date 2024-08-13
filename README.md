# dotfiles
> [!NOTE]
> This comes from my first (successful, lol) Arch installation.
> 
> This will not only incluce my dotfiles but also a list of installed packages, commands, images and other stuff that will achieve a installation that suits my likings.
> 
> With that said, expect that some stuff won't work for you because of some of my quirks, like connecting to my hidden wifi before using archinstall as example and simply because I write everything down with my *Lenovo ThinkPad T480* in mind.

My goal is to make it as easy and fast as possible **for me** to get my stuff running again should i consider a fresh install at any point.

## Preview
In the end, it should look like this:

[<img src="https://raw.githubusercontent.com/hypercrites/dotfiles/main/screenshot_preview.png">](https://raw.githubusercontent.com/hypercrites/dotfiles/main/screenshot.png)


## Index
- [Preparing](#Preparing)
- [Installation](#Installation)
- [First packages and settings](#first-packages-and-settings)
- [Additional packages](#additional-packages)
- [Ricing](#ricing)
- [Tweaking](#tweaking)


## Preparing

1. In order to multiboot with windows, i shrunk one of my NTFS-Partitions of arround 100GB (unallocated) to have enough space for Arch and all the other stuff later.
2. Put the arch-iso on a USB-stick with rufus and boot from said USB-stick.
   
### WLAN

1. Choose the right keyboard-layout, in my case `loadkeys de-latin1`.
2. Connect to WLAN; first `iwctl` then `station wlan0 connect-hidden <ssid>`.
   - Important; Since i know my network-name and everything i don't need to scan and select it, i can just connect.
   
### Partitioning and mounting

1. Prepare the partitions; `lsblk` lists all discs and partitions.
2. Since i wanna use my second NVMe, its `cfdisk /dev/nvme1n1` for me.
    - Select *Free Space*, 1GiB, *Type*: EFI System.
    - Select *Free Space* again, *enter* (for the entire free space left), *Type*: Linux Filesystem. Select *Write, yes, Quit*.
3. To confirm, enter `lsblk` again. In my case i have `nvme1n1p3` and `nvme1n1p4` now.
4. Now format the two new partitions.
    - For the 1GiB EFI-Partition type `mkfs.fat -F32 /dev/nvme1n1p3`
    - For the filesystem type `mkfs.ext4 /dev/nvme1n1p4`.
5. Now mount the two new partitions.
    - `mount /dev/nvme1n1p4 /mnt`
    - `mount --mkdir /dev/nvme1n1p3 /mnt/boot`

[This video](https://www.youtube.com/watch?v=eUhsFV0xIQc) helped me alot.

## Installation

1. **archinstall**
2. Setup *Locales*, *Hostname*, *User account* (sudo: *true*), Timezone,
3. Select *Disc configuration*, chose *Pre-mounted configuration* (Thats what *Partitioning and mounting* was for), then `/mnt`. 
4. Bootloader; **Grub**
5. Profile > Desktop > Xfce4
   - *Graphics driver* and *Greeter* as is
6. Audio; Pipewire
7. Kenrels; linux
8. Network configuration; *Use NetworkManager*
9. Leave the rest, chose **Install**, then *yes*, `exit`, `reboot`

## First packages and settings

### GRUB

1. Open Terminal, install `sudo pacman -S os-prober ntfs-3g`
2. `sudo os-prober`
3. `sudo nano /etc/default/grub`
4. At the bottom, uncomment *GRUB_DISABLE_OS_PROBER=false*, CTRL+O, enter, CTRL+X
5. `sudo grub-mkconfig -o /boot/grub/grub.cfg`
6. Reboot

### AUR

1. Get *yay* to install stuff from AUR; [github](https://github.com/Jguer/yay?tab=readme-ov-file#installation)
2. Get *Pamac*; `yay -S pamac-aur`

~ under construction

## Additional packages

<sup>There is no order, just some packages i use so i don't forget them.</sup>

gimp, gimp-gap, 

## Ricing

### Theme and Icons
1. Theme: `sudo pacman -S arc-gtk-theme`
2. Icons: [Tela icons](https://github.com/vinceliuice/Tela-icon-theme?tab=readme-ov-file#installation) (because i couldn't get from the AUR)
3. Cursor: `yay -S breeze-snow-cursor-theme`

### Terminal
1. `sudo pacman -S zsh`
2. Font *mononoki*; `yay -S ttf-mononoki`, `sudo pacman -S ttf-mononoki-nerd`
3. [powerlevel10k](https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#getting-started)

## Tweaking
1. Apply GTK-theme everywhere: `sudo nano /etc/environment`; `GTK_THEME=Arc-Dark`
2. Apply GTK-theme to Qt: `sudo nano /etc/environment`; `QT_QPA_PLATFORMTHEME=gtk2`
3. And `nano ~/.config/Trolltech.conf`;
 ```
[Qt]
style=GTK+
```
5. Apply Cursor-Theme to LightDM: `sudo nano /etc/lightdm/lightdm-gtk-greeter.conf`;
```
cursor-theme-name = Breeze_Snow
cursor-theme-size = 16
```

~ to be continued
