#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '


export PATH=~/bin/:$PATH

export GOPATH=/scratch/go
export PATH=$GOPATH/bin:$PATH

# node path is required for stuff like prettier which is installed
# by npm
export PATH=/opt/node-v8.9.4-linux-x64/bin/:$PATH

export PATH=/home/cbrake/.local/bin:$PATH

#export TERM=screen-256color

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/cbrake/google-cloud-sdk/path.bash.inc' ]; then source '/home/cbrake/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/cbrake/google-cloud-sdk/completion.bash.inc' ]; then source '/home/cbrake/google-cloud-sdk/completion.bash.inc'; fi

export TMPDIR=~/tmp

qq() {
    clear
    local gpath="${GOPATH:-$HOME/go}"
    "${gpath%%:*}/src/github.com/y0ssar1an/q/q.sh" "$@"
}
rmqq() {
    if [[ -f "$TMPDIR/q" ]]; then
        rm "$TMPDIR/q"
    fi
    qq
}
