# Colors:
# set fish_color_normal F8F8F2 # the default color
set fish_color_normal normal
# set fish_color_command FFFFFF # the color for commands
set fish_color_command --bold
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
set fish_color_search_match 49483E
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
    printf (pwd)
    printf '>'
end

set SHELL /usr/local/bin/fish
set EDITOR /usr/local/bin/vim



alias serial='pio device monitor -b 115200 --echo'
alias ejsd='diskutil unmount'
alias lat='ls -lahtr'
alias matlab='/Applications/MATLAB_R2017a.app/bin/matlab -nodisplay'
function v
    nvr --servername /tmp/nvr_(tmux display-message -p '#W'| md5 | cut -c1-7) --remote $argv
end

function vs
    nvr --servername /tmp/nvr_(tmux display-message -p '#W' | md5 | cut -c1-7)
end

function vc
    rm /tmp/nvr_(tmux display-message -p '#W' | md5 | cut -c1-7)
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


