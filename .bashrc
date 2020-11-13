# this file gets source on interactive, non-login shells (start terminal in GUI, etc)
eval $(keychain --eval --quiet id_rsa ~/.ssh/id_rsa)

PATH=~/.local/bin:$PATH
PATH=~/go/bin:$PATH
PATH=~/.cargo/bin:$PATH
