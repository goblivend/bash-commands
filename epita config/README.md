# My config for epita PIE 

## .bashrc

```sh

alias ga='git add'
alias gc='git commit -m'
alias gp='git push --follow-tags'
alias ls='ls --color=auto'


```

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


