# Colors:
# set fish_color_normal F8F8F2 # the default color
set fish_color_normal white
# set fish_color_command FFFFFF # the color for commands
set fish_color_command white --bold
# set fish_color_quote E6DB74 # the color for quoted blocks of text
set fish_color_quote yellow
# set fish_color_redirection AE81FF # the color for IO redirections
set fish_color_redirection brmagenta
# set fish_color_end F8F8F2 # the color for process separators like ';' and '&'
set fish_color_end normal
# set fish_color_error FF0002 # the color used to highlight potential errors
set fish_color_error FF0002
# set fish_color_param A6E22E # the color for regular command parameters
set fish_color_param green
# set fish_color_comment 75715E # the color used for code comments
set fish_color_comment 75715E
# set fish_color_match F8F8F2 # the color used to highlight matching parenthesis
set fish_color_match normal
# set fish_color_search_match --background=49483E # the color used to highlight history search matches
set fish_color_search_match --background=49483E
# set fish_color_operator AE81FF # the color for parameter expansion operators like '*' and '~'
set fish_color_operator brmagenta
# set fish_color_escape 66D9EF # the color used to highlight character escapes like '\n' and '\x70'
set fish_color_escape cyan
# set fish_color_cwd 66D9EF # the color used for the current working directory in the default prompt
set fish_color_cwd cyan

# Additionally, the following variables are available to change the highlighting in the completion pager:
# set fish_pager_color_prefix F8F8F2 # the color of the prefix string, i.e. the string that is to be completed
set fish_pager_color_prefix normal
# set fish_pager_color_completion 75715E # the color of the completion itself
set fish_pager_color_completion 75715E
# set fish_pager_color_description 49483E # the color of the completion description
set fish_pager_color_description 49483E
# set fish_pager_color_progress F8F8F2 # the color of the progress bar at the bottom left corner
set fish_pager_color_secondary F8F8F2 # the background color of the every second completion

function fish_prompt
    set_color $fish_color_cwd
    printf $PWD
    printf '>'
end

set SHELL /usr/local/bin/fish
set EDITOR /usr/local/bin/nvim
set PYENV_ROOT $HOME/.pyenv


status --is-interactive; and source (pyenv init -|psub)
status --is-interactive; and . (pyenv virtualenv-init -|psub)

alias serial='pio device monitor -b 115200 --echo --eol LF'
alias pserial='pio device monitor -b 115200 --eol LF'
alias ejsd='diskutil unmount'
alias lat='ls -lahtr'
alias matlab='/Applications/MATLAB_R2017a.app/bin/matlab -nodisplay'
alias matlab2020='/Applications/MATLAB_R2020a.app/bin/matlab -nodesktop'
alias gitlogin='ssh-add -K ~/.ssh/id_rsa_personal'
alias usb_work="sudo killall -STOP -c usbd"
alias usb_resume="sudo killall -CONT usbd"

function v
    if set -q TMUX
        nvr -s --servername /tmp/nvr_"$USER"_(tmux display-message -p '#I') --remote $argv
    else
        nvr -s --remote $argv
    end
end

function vs
    if set -q TMUX
        rm /tmp/nvr_"$USER"_(tmux display-message -p '#I')
        nvr -s --servername /tmp/nvr_"$USER"_(tmux display-message -p '#I')
    else
        nvr -s
    end
end

function vsr
    tmux respawnp -t 0:2.0
end

function win
    if count $argv > /dev/null
        set -l relpath (greadlink -f $argv)
        echo $relpath
        tmux new-window -n (basename $relpath) -c $relpath vs \; set-window-option remain-on-exit on \; split-window -c $relpath
    else
        tmux new-window -n (adjspecies) vs \; set-window-option remain-on-exit on \; split-window
    end
end

function vc
    rm /tmp/nvr_$USER_(tmux display-message -p '#I')
end

function glob
    if [ $argv != "" ]
        find $argv -type f
    else
        find . -type f
    end
end

function sshgit
    sed -i '' -E 's/https\:\/\/github.com\/([a-zA-Z0-9\-_]+\/[a-zA-Z0-9\-_]+)/git@github.com\:\1/g' $argv
end

function config
    git --git-dir=$HOME/.cfg/ --work-tree=$HOME $argv
end

function pdf
    pandoc $argv -o (dirname $argv[1])/(basename $argv[1] .md).pdf; and open (dirname $argv[1])/(basename $argv[1] .md).pdf;
end

function pdfw
    pandoc -Vmargin-left=0.75in -Vmargin-right=0.75in -Vmargin-top=1in -Vmargin-bottom=1in $argv -o (dirname $argv[1])/(basename $argv[1] .md).pdf; and open (dirname $argv[1])/(basename $argv[1] .md).pdf;
end

function cpscreen
    cp ~/Screenshots/(ls -tp ~/Screenshots | grep -v \/\$ | head -1) .;
end

rvm default
