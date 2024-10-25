abbr --add tn 'tmux new-session -s'
abbr --add ta 'tmux attach -t'
abbr --add tls 'tmux ls'
abbr --add gg 'git grep'
abbr --add gb 'git branch'
abbr --add gc 'git checkout'
abbr --add gcb 'git checkout -b'
abbr --add gcm 'git checkout master'
abbr --add gs 'git status'
abbr --add gw 'git whatchanged'
abbr --add gcl 'git clone'
abbr --add gfa 'git fetch --all'
abbr --add gpb 'git push -u origin (git_branch)'
abbr --add gl 'git log'
abbr --add glo 'git log --pretty="oneline"'
abbr --add glh 'git log --pretty="%H"'
abbr --add gre 'git rebase'
abbr --add gri 'git rebase -i'
abbr --add grc 'git rebase --continue'
abbr --add gra 'git rebase --abort'
abbr --add grh 'git reset "HEAD^"'
abbr --add gad 'git add'
abbr --add gco 'git commit'
abbr --add gls 'git ls-files'
abbr --add gdi 'git diff'
abbr --add gdc 'git diff --cached'
abbr --add gds 'git diff --shortstat'
abbr --add gdS 'git diff --shortstat --cached'
abbr --add gdm 'git diff (git merge-base --fork-point origin/master)'
abbr --add n 'nvim'

function fish_reload
    . ~/.config/fish/config.fish
end

function prompt
    echo $argv "(y\N)"
    read -p "" answer
    if test $answer = "y"
        return 0
    end
    return 1
end

function print_array
    for item in $argv
        echo $item
    end
end

function dotfiles_sync
    set old_pwd (pwd)
    cd ~/.dotfiles

    git remote rm origin
    git remote add origin git@github.com:jussi-kalliokoski/dotfiles.git

    if contains force $argv
        git reset --hard origin/master
        cd $old_pwd
        return 0
    end

    if not git diff --quiet HEAD &> /dev/null
        echo "You have uncommitted changes to your dotfiles."
        if prompt "Would you like to commit them in?"; and git commit -a

            git pull --rebase -u origin master
            git push -u origin master
            cd $old_pwd
            return 0
        else
            echo "Please commit your local changes before sync."
            cd $old_pwd
            return 1
        end
    end
    git pull -u origin master
    cd $old_pwd
end

function now -d "Prints the current time (UNIX Epoch) in milliseconds"
    coffee -e "process.stdout.write(Date.now()+'')"
end

function add-host
    printf "%s\t%s" (host $argv[1] | awk "{print \$4}") $argv[1]
end

function git-list-branches -d "Lists branches in the git repo without highlighting current one"
    git branch | ack -o "(?<=..).+"
end

function git-pick-file -d "Cherry pick commits that have changes to specified files"
    # store current branch
    set -l branch (git_branch)
    # checkout target branch
    git checkout $argv[1]
    # shift the argv array
    set -e argv[1]
    # store the list of commits containing changes to the specified files
    set -l commits (git log --pretty="%H" --reverse -- $argv)
    # checkout back to the original branch
    git checkout $branch
    # cherry-pick each stored commit
    for commit in $commits
        git cherry-pick $commit
    end
end

function git-sed -d "Performs a sed operation for all files in the git tree"
    sed $argv (git ls-files)
end

function git-get-commits -d "Gets the hashes of commits in the log."
    git log --pretty="%H" $argv
end

function git-get-commit-index -d "Gets the how many commits ago a commit in the log is."
    set -l commits (git-get-commits)
    set -l index 1
    for commit in $commits
        if echo $commit | ack $argv[1] > /dev/null
            break
        end
        set index (math $index + 1)
    end
    echo $index
end

function git-cid -d "Print the ID of the commit n, where n=1 is the latest commit"
    git-get-commits -n $argv[1] | tail -n 1
end

function git-cc -d "Compare (diff) two commits"
    git diff (git-cid $argv[2])..(git-cid $argv[1])
end

function tunnel -d "Tunnel a local port to a remote port"
    set -l local_port $argv[1]
    set -l remote_port $argv[2]
    ssh $TUNNEL_ACCOUNT -R $remote_port:(lan_ip):$local_port -N
end

function row -d "Gets the Nth row of each line"
    set -l n $argv[1]
    awk "{ print \$$n }"
end

function fl -d "Returns the filenames of a result of a grep operation"
    ack -o "^[^:]+" | sort | uniq
end

function nth -d "Gets the nth line of input"
    set -l length 1
    set -l first (math $argv[1] + $length)
    head -n $first | tail -n $length
end

function rn -d "Renames a file"
    set -l directory (dirname $argv[1])
    mv $argv[1] $directory/$argv[2]
end

function standup-for-repo
    for branch in git-list-branches
        git standup $branch
    end | awk "!seen[\$0]++"
end

function standup -d "Shows what you did yesterday"
    for repo in ~/Code/*/
        cd $repo
        echo "$repo:"
        standup-for-repo
    end
end

function gopg -d "Local golang playground"
    vim (mktemp -d)/main.go +w
end

function GET
    curl -iX GET $argv
end

function POST
    curl -iX POST $argv
end

function DELETE
    curl -iX DELETE $argv
end

function PUT
    curl -iX PUT $argv
end

function PATCH
    curl -iX PATCH $argv
end

function json
    underscore print --color
end

function glh
    git log --pretty="%H" $argv
end

function c2hex
    pbpaste | node -e '
const input = fs.readFileSync("/dev/stdin", "utf-8").trim();
const color = input.split(/\s+/).map(s => parseInt(s, 10));
const hex = "#" + color.map(v => v.toString(16).padStart(2, "0")).join("");
console.log(hex);
    ' | pbcopy
end
