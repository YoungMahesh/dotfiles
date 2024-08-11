```bash
nixos-rebuild switch
```

### after installation
- brightness (this is simplest way)
    - open firefox -> visit 'soft-brightness-plus' of gnome -> install -> done

### error while installation
- fix partitioning error
    - format sdd/hdd where you want to install nixos with ext4 file system

### manual partitioning
- new partition table -> GUID, partition type: GPT
- mount point: /boot/efi
    - size: 512 MB
    - file system: fat32
    - flags: boot
- mount point: (no mount point)
    - size: 8192 MB
    - file system: linuxswap
    - flags: swap
- mount point: /
    - size: all remaining
    - file system: ext4
    - flags: root



### review later
- https://discourse.nixos.org/t/can-i-move-etc-nixos-to-my-dotfiles-and-symlink-it-back-to-etc-nixos/4833/3
- `nix-env --list-generations`   # list profile generations
