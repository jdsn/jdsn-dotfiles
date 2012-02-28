# .bashrc of jdsn

export EDITOR=/usr/bin/vim

# colors
_bbold="$(path tput bold 2> /dev/null;)"
_bred="$(path tput setaf 1 2> /dev/null)"
_bgreen="$(path tput setaf 2 2> /dev/null)"
_blgrey="$(path tput setaf 7 2> /dev/null)"
_blblue="$(path tput setaf 6 2> /dev/null)"
_sgr0="$(path tput sgr0 2> /dev/null)"

# for xterm:
# export PS1='$(ppwd \l)\u@\h:\w$(__git_ps1 " (%s)")> '
# for bash
#export PS1='[\u@\h]\w$(__git_ps1 " (%s)")> '
export PS1='\[$_blgrey\]\u@\h\[$_sgr0\] \w\[$_bgreen\]$(__git_ps1 " (%s)")\[$_sgr0\]> '

if [ "x$BASH" == "x/usr/bin/rbash" ]
then
  export PS1='\u@\h:\w> '
fi

# enable colors in less for "git diff"
# export LESS="-RS#3NM~g"
export LESS="-RS#3M~g"

export MAN_POSIXLY_CORRECT=1

test -s ~/.alias && . ~/.alias
export PATH=$PATH:~/bin

# paths for OBS and IBS (OpenBuildService)
#export O=/data/OBS
#export I=/data/IBS
#export Oh=$O/home:jdsn
#export OhF=$O/home:jdsn:Factory

function mkcd
{
  mkdir -p "$*" && cd "$*";
}
