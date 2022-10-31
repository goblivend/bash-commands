### Auto Completion

so... copy paste the completion template under your command file (better comprehension)<br />
then replace '(complete line for me)' by the different possible parameters (see in .bash.sh for better comprehension)<br />
and add :<br />

```sh
complete -C <file path> <cmd name>
```

<br />
in the .bashrc
### my.bashrc

```sh
setxkbmap -option caps:escape

source /mnt/g/Data\ Ivan/code/Bash/bash-commands/bash_commands/.acdc.sh
source /mnt/g/Data\ Ivan/code/Bash/bash-commands/bash_commands/.bash.sh
source /mnt/g/Data\ Ivan/code/Bash/bash-commands/bash_commands/.git.sh
source /mnt/g/Data\ Ivan/code/Bash/bash-commands/bash_commands/.java.sh

complete -C "/mnt/g/Data\ Ivan/code/Bash/bash-commands/bash_commands/.bash.sh" cdto
export DISPLAY=:0
```
