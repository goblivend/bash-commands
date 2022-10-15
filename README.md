# My Bash Commands

## Status

cdto currently works
gctp doesn't really works the issue is with the nbarg test
    1 != 1 => have to find a solution about that

## PS1

Long version :

```sh
export PS1="\j \u@\H : \w \$"
```

might replace ``\H`` by ``\h``\
might replace `\w` by `\W`\
The number of cmds executed : `\!` or `\#` for shorter one

<https://bashrcgenerator.com/>\
<https://www.vincentliefooghe.net/content/linux-unix-variables-du-prompt-ps1>\
<https://www.cyberciti.biz/faq/bash-shell-change-the-color-of-my-shell-prompt-under-linux-or-unix/>\
<https://www.cyberciti.biz/tips/howto-linux-unix-bash-shell-setup-prompt.html>\
<https://tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html>\

WSL :

```sh
export PS1="\[\e]0;\u@\h: \w\a\]\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$"
```
Epita :
```sh
__build_prompt()
{
    PS1="\[\e[0;36m\]$? \[\e[01;32m\](\A) \u@\h\[\e[00m\]:\[\e[01;34m\]\w\[\e[00m\]\n\[\e[01;31m\]\j\[\e[00m\]$ "
}
PROMPT_COMMAND="__build_prompt$PROMPT_COMMAND"
```




## Scrot (epita screens)

Scrot :

```sh
scrot #whole screen
scrot -s # Select area
scrot -u # current window
scort -d 5 # Wait 5 seconds before screen
scort -d 5 -c # Wait 5 seconds before screen and puts countdown
```

<https://ostechnix.com/take-screenshots-command-line-using-scrot-linux/>
