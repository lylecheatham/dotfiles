alias serial='pio device monitor -b 115200 --echo'
alias la='ls -lah'
alias lat='ls -lahtr'
alias ejsd='diskutil unmount'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
export EDITOR='nvim'
export PYENV_ROOT='$HOME/.pyenv'
export WATLIB="21187006508758"
export PATH=${PATH}:/usr/local/sbin
# MacPorts Installer addition on 2019-03-26_at_23:36:32: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:/usr/local/lib"
# Finished adapting your PATH environment variable for use with MacPorts.
# MacPorts Installer addition on 2019-03-26_at_23:36:32: adding an appropriate MANPATH variable for use with MacPorts.
export MANPATH="/opt/local/share/man:$MANPATH"
# Finished adapting your MANPATH environment variable for use with MacPorts.

# gclib
export DYLD_LIBRARY_PATH="/Applications/gclib/dylib/:${DYLD_LIBRARY_PATH}"


exec fish

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
. "$HOME/.cargo/env"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/work/.google-cloud-sdk/path.bash.inc' ]; then . '/Users/work/.google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/work/.google-cloud-sdk/completion.bash.inc' ]; then . '/Users/work/.google-cloud-sdk/completion.bash.inc'; fi
