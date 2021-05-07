# this file gets sourced for login shells (ssh)
# shellcheck source=/home/cbrake/.bashrc
. ~/.bashrc

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
