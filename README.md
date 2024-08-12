# dotfiles
> [!NOTE]
> This comes from my first (successful, lol) Arch installation.
> 
> This whill not only incluce my dotfiles but also a list of installed packages, commands, images and other stuff that will archieve a installation that suits my likings.
> 
> With that said, expect that some stuff won't work for you because of some of my quirks, like connecting to my hidden wifi before using archinstall as example.

My goal is to make it as easy and fast as possible **for me** to get my stuff running again should i consider a fresh install at any point.

## Preview
At the end, it should look like this:

[<img src="https://raw.githubusercontent.com/hypercrites/dotfiles/main/screenshot_preview.png">](https://raw.githubusercontent.com/hypercrites/dotfiles/main/screenshot.png)


## Index
- [Preparing](#Preparing)
- Installation
- First packages
- First Settings
- ricing
- tweaking

## Preparing

1. In order to multiboot with windows, i shrunk one of my NTFS-Partitions of arround 100GB (unallocated) to have enough space for Arch and all the other stuff later.
2. Put the arch-iso on a USB-stick with rufus and boot from said USB-stick.
   
### WLAN

1. Choose the right keyboard-layout, in my case `loadkeys de-latin1`.
2. Connect to WLAN; first `iwctl` then `station wlan0 connect-hidden <ssid>`. Important; Since i know my network-name and everything i don't need to scan and select it, i can just connect.
   
### Partitioning and mounting

1. Prepare the partitions; `lsblk` lists all discs and partitions.
2. Since i wanna use my second NVMe, its `cfdisk /dev/nvme1n1`.
3. Select *Free Space*, 1GiB, *Type*: EFI System.
4. Select *Free Space* again, *enter* (for the entire free space left), *Type*: Linux Filesystem. Select *Write, yes, Quit*.
5. To confirm, enter `lsblk` again. In my case i have `nvme1n1p3` and `nvme1n1p4` now.
6. Now format the two new partitions. For the 1GiB EFI-Partition type `mkfs.fat -F32 /dev/nvme1n1p3`, for the filesystem type `mkfs.ext4 /dev/nvme1n1p4`.

[This video](https://www.youtube.com/watch?v=eUhsFV0xIQc) helped me alot.

~ to be continued
