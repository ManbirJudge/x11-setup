# load configs
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi


if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# aliases
alias ls='ls --color=auto -AF'
alias grep='grep --color=auto'
