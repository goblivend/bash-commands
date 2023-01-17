# nixConfig

## Use 

Put a `configuration.nix` file in `/etc/nixos/`.\
You will need admin rights to do so `sudo ...`\
Afterward to restart and update you will need to execute `sudo nixos-rebuild switch`





## Packages 

### Nice and useful 

 - `alacritty` Better console 
 - `vim` ... Do I really need to explain why
 - `tree` To print how files are placed in subdirectories
 - `bat` Like `cat` but it has the advantage to use syntax highlighting
 - `scrot` Tool to capture screen
 - `imageMagick` Tool to edit image with filters with the command `convert`

### Softwares

 - `firefox`
 - `discord`
 - `thunderbird`
 - `pavucontrol` For audio control
 - `keepassxc` For password management, with locally stored d

### Code 

 - `git`

#### C Code

 - `gdb` debugger (C but also more)
 - `gcc` compiler (C but also more)
 - `criterion` Unit testing
 - `meson` Advanced Makefile
 - `ninja` to use meson
 - `clang-tools`
 - `SDL2.dev`

#### Python

 - `python3`
 - `pywal`
 - `python310Packages.pip`

#### Haskell

 - `ghc` Compiler
 - `cabal-install` Install Haskell Packages

#### More

 - `oh-my-zsh` Shell (like sh but with more features)
 - `polybar` For i3 status
 - `rofi` Nice app explorer
 - `networkmanager_dmenu` 
 - `postgresql`
 - `man-pages`
 - `man-pages-posix`
 - `killall`

#### For AFS

 - `sshfs-fuse`
 - `wget`

## Mounting a partition 

```nix
    fileSystems."/path/to/mountpoint" = {
        device = "/path/of/device";
        fsType = "<FileSystem  : (ntfs3, ext4...)>";
        options = [ "rw" "uid=1000" ];
    };
```

## XServer (WM, DM...)

```nix
services.xserver = {
    enable = true;
    desktopManager = {
        xterm.enable = false;
    };
    displayManager = {
        defaultSession = "none+i3";
    };
    windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
            dmenu #application launcher most people use
            i3status # gives you the default i3 status bar
            i3lock #default i3 screen locker
            i3blocks #if you are planning on using i3blocks over i3status
       ];
       package = pkgs.i3-gaps;
    ];
};

```

