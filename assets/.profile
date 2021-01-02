export SHELL=/bin/bash
export EDITOR='nano'
export VISUAL='nano'

alias ls="ls --group-directories-first --human-readable --color=auto"
alias ll="ls -lF"
alias la="ll -A"

dockerImageName="simbo/node"
export PS1="\[\e[0;96;104m\]▌\[\e[0;97;104m\]\u\[\e[0;90;104m\]@\[\e[0;37;104m\]docker\[\e[0;90;104m\]:\[\e[0;37;104m\]${dockerImageName}\[\e[0;96;104m\]▐\[\e[m\] \[\e[0;96m\]\w\[\e[m\] \[\e[0;95m\]❯\[\e[m\] \[\e0"
