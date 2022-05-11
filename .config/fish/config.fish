set -x LANG en_US.UTF-8
set -x LESS "-EQRX"
set -x EDITOR "vim"
set -x BROWSER "open"
set -x DOTFILES_SYNC_COMMAND "curl https://raw.githubusercontent.com/jussi-kalliokoski/dotfiles/master/install.sh | bash"

function git_info -d "Print a star if the current git branch is dirty"
    git diff --quiet HEAD &> /dev/null
    if test $status = 1
        echo '*'
    end
end

function git_branch -d "Print the current git branch"
    git symbolic-ref --short HEAD 2>/dev/null
end

# Simplified: [DIRECTORY] - [USERMODE] - <GITSTATUS>
function fish_prompt
    set_color --bold blue
    echo -n '['
    set_color --bold white
    echo -n (prompt_pwd)
    set_color --bold blue
    echo -n '] - ['
    set_color --bold purple
    if [ (id -u -rn) = "root" ]
        echo -n '#'
    else
        echo -n '$'
    end
    set_color --bold blue
    echo -n '] '
    set -l GIT_BRANCH (git_branch)
    if [ "$GIT_BRANCH" != "" ]
        echo -n '<'
        echo -n $GIT_BRANCH
        echo -n (git_info)
        set_color --bold blue
        echo -n '> '
    end
    set_color normal
    # Tell TMUX the CWD
    if set -q TMUX; tmux setenv TMUXPWD_(tmux display -p "#D" | tr -d "%") "$PWD"; end
end

# Load aliases and other functions
. ~/.config/fish/functions.fish

# Set basic path
set PATH /sbin /usr/sbin /bin /usr/bin

# More paths
set PATH /usr/local/bin "$HOME/bin" $PATH

# Include machine-specific extras, if any
if test -f ~/.config/fish/extras.fish; . ~/.config/fish/extras.fish; end

# Include iTerm2 integration where applicable
if test -f ~/.iterm2_shell_integration.fish; . ~/.iterm2_shell_integration.fish; end

# volta.sh
set -gx VOLTA_HOME "$HOME/.volta"
test -s "$VOLTA_HOME/load.fish"; and source "$VOLTA_HOME/load.fish"
string match -r ".volta" "$PATH" > /dev/null; or set -gx PATH "$VOLTA_HOME/bin" $PATH

# toolchain
test -s "$HOME/tools/plugin.fish"; and source "$HOME/tools/plugin.fish"
