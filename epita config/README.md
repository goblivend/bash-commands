# My config for epita PIE 

## .bashrc

```sh

alias ga='git add'
alias gc='git commit -m'
alias gp='git push --follow-tags'
alias ls='ls --color=auto'


```
## .vimrc

Code Snipets : https://github.com/SirVer/ultisnips \
Comments : https://github.com/tpope/vim-commentary \
Surrounds : https://github.com/tpope/vim-surround \
Auto-pairs :

## Mounting afs

you can look at the cri's [documentation](https://doc.cri.epita.fr/from_home/afs/)

Before beginning the setup, you will need these [prerequisite](### Prerequisites)

The first step is to complete the file `~/.ssh/config` with : 
```ssh
Host ssh.cri.epita.fr
    GSSAPIAuthentication yes
    GSSAPIDelegateCredentials yes
```

Then you need to "log in" to get access : 
```sh
kinit -f xavier.login@CRI.EPITA.FR
``` 
(the case is important)

then instead of browsing interactively, I advise to directly mount the afs : 
```sh
mkdir -p ~/afs/ # Or anywhere, and any name you want
sshfs -o reconnect xavier.login@ssh.cri.epita.fr:/afs/cri.epita.fr/user/l/lo/xavier.login/u/ ~/afs # If you changed the name of the folder, change it here too
```

After some time, the connection will be closed between your folder and the afs.

In order to reestablish the connection to the afs, I advise to create this function in your `~/.bashrc` (or create a file or anything you are used to do) with the following code :
```sh
afs_reconnect() {
  kinit -f xavierlogin@CRI.EPITA.FR
  umount ~/afs/ # Or the path you chose
  sshfs -o reconnect xavier.login@ssh.cri.epita.fr:/afs/cri.epita.fr/user/l/lo/xavier.login/u/ ~/afs # If you changed the name of the folder, change it here too
}
```
### Prerequisites

you will need the commands `kinit` and `umount` `sshfs`

In NixOs, you will have to add the packages `krb5` and `sshfs-fuse`

you can do so by adding the following snippet in `/etc/nixos/configuration.nix`

(you will need the administrators rights to do so, you can do it using `sudo EDITOR /etc/nixos/configuration.nix`)
```nix
environment.systemPackages = with pkgs; [
    krb5
    sshfs-fuse
];
``` 

Then you will have to reload you configuration using `sudo nixos-rebuild switch`

## i3 config
Located at `afs/.confs/config/i3/config`
```i3
exec_always curl "https://raw.githubusercontent.com/goblivend/bash-commands/main/epita%20config/background$(($RANDOM % 4 + 1)).jpg" --output ~/afs/bash-commands/background.jpg # Random image downloaded when opening the session (backgrounds stored in this repo)
exec_always feh --bg-scale ~/afs/bash-commands/background.jpg # Set the random image as background
bindsym $mod+Shift+i exec ~/afs/bash-commands/i3lock.sh # Win+Shift+I to I3 lock using i3lock.sh

```



## Backgrounds

![test](./background1.jpg)
![test](./background2.jpg)
![test](./background3.jpg)
![test](./background4.jpg)


