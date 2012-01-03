# .bashrc of jdsn

export EDITOR=/usr/bin/vim

# for xterm:
# export PS1='$(ppwd \l)\u@\h:\w$(__git_ps1 " (%s)")> '
# for bash
export PS1='\u@\h:\w$(__git_ps1 " (%s)")> '

# enable colors in less for "git diff"
# export LESS="-RS#3NM~g"
export LESS="-RS#3M~g"

export MAN_POSIXLY_CORRECT=1

test -s ~/.alias && . ~/.alias
PATH=$PATH:~/bin

# paths for OBS and IBS (OpenBuildService)
export O=/data/OBS
export I=/data/IBS
export Oh=$O/home:jdsn
export OhF=$O/home:jdsn:Factory
