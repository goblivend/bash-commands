# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -d ~/afs/bin ] ; then
	export PATH=~/afs/bin:$PATH
fi

if [ -d ~/.local/bin ] ; then
	export PATH=~/.local/bin:$PATH
fi

export LANG=en_US.utf8
export NNTPSERVER="news.epita.fr"

export EDITOR=vim

# Color support for less
#export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
#export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
#export LESS_TERMCAP_me=$'\E[0m'           # end mode
#export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
#export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
#export LESS_TERMCAP_ue=$'\E[0m'           # end underline
#export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

alias ls='ls --color=auto'
alias grep='grep --color -n'
OLDPS1='[\u@\h \W]\$ '


# Test if current Terminal is xfce, since PROMPT_COMMAND does not seem to work the same way, just removing exit code
# Only used when going to sup session
__build_prompt()
{
    PS1="\[\e[0;36m\]$? \[\e[01;32m\](\A) \u@\h\[\e[00m\]:\[\e[01;34m\]\w\[\e[00;36m\] \$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\[\e[00m\]\n\[\e[01;31m\]\j\[\e[00m\]$ "
}
PROMPT_COMMAND="__build_prompt$PROMPT_COMMAND"


alias gp='git push --follow-tags'
alias gc='git commit -m'
alias gs='git status'
alias ga='git add'
alias gclone='git clone'
alias back='cd $OLDPWD'
alias cf='clang-format -i'
alias mymake='cp ~/afs/bash-commands/Makefile . && ls'
alias gam='git ls-files --modified | xargs git add' 

alias gcompile='gcc -Wextra -Wall -Werror -std=c99 -pedantic -fsanitize=address -g'
alias ggrind='gcc -Wextra -Wall -Werror -std=c99 -pedantic -g'
alias gcriterion='gcc -Wextra -Wall -Werror -std=c99 -pedantic -g -lcriterion'

afs_remount() {
    echo "kinit -f ivan.imbert@CRI.EPITA.FR"
    kinit -f ivan.imbert@CRI.EPITA.FR
    
    echo "unmount '~/afs/'"
    umount "~/afs/"

    echo "sshfs -o reconnect ivan.imbert@ssh.cri.epita.fr:/afs/cri.epita.fr/user/i/iv/ivan.imbert/u/ ~/afs"
    sshfs -o reconnect ivan.imbert@ssh.cri.epita.fr:/afs/cri.epita.fr/user/i/iv/ivan.imbert/u/ ~/afs

}



testC() { 
    gcompile -o $1 $1.c && ./$1 | cat -e
}

testCgrind() { 
    ggrind -o $1 $1.c && valgrind ./$1 | cat -e
}

testCmain() {
    gcompile -o main main.c $1 && ./main | cat -e
}

testCmaingrind() {
    ggrind -o main main.c $1 && valgrind ./main | cat -e
}

alias touchF=~/afs/bash-commands/c_header.sh
piscine(){
    mkdir $1
    cd $1
    touchF -n $1 -e 'c'
    cp ~/afs/bash-commands/main.c .
}

alias gdb='gdb -q'

bind 'set mark-symlinked-directories on'

setxkbmap -option caps:escape
# curl parrot.live 


export PGDATA="$HOME/postgres_data"
export PGHOST="/tmp"

