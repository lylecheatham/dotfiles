alias serial='pio device monitor -b 115200 --echo'
alias la='ls -lah'
alias lat='ls -lahtr'
alias ejsd='diskutil unmount'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
export EDITOR='nvim'
export PYENV_ROOT='$HOME/.pyenv'
export PATH="$HOME/.cargo/bin:$PATH"
export WATLIB="21187006508758"
export PATH=${PATH}:/usr/local/sbin
exec fish


##
# Your previous /Users/Lyle/.bash_profile file was backed up as /Users/Lyle/.bash_profile.macports-saved_2019-03-26_at_23:36:32
##

# MacPorts Installer addition on 2019-03-26_at_23:36:32: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


# MacPorts Installer addition on 2019-03-26_at_23:36:32: adding an appropriate MANPATH variable for use with MacPorts.
export MANPATH="/opt/local/share/man:$MANPATH"
# Finished adapting your MANPATH environment variable for use with MacPorts.


# MacPorts Installer addition on 2019-04-15_at_13:09:07: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


# MacPorts Installer addition on 2019-04-15_at_13:09:07: adding an appropriate MANPATH variable for use with MacPorts.
export MANPATH="/opt/local/share/man:$MANPATH"
# Finished adapting your MANPATH environment variable for use with MacPorts.

export PATH="/usr/local/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
