function fish_reload
	. ~/.config/fish/config.fish
end

function tn
	tmux new-session -s $argv
end

function ta
	tmux attach -t $argv
end

function tls
	tmux ls
end

function gg
	git grep $argv
end

function gb
	git branch $argv
end

function gc
	git checkout $argv
end

function gs
	git status $argv
end

# Lists all files in the git tree
function git-files
	git ls-tree -r master | awk "{print \$4}"
end

# Performs a sed operation for all files in the git tree
function git-sed
	sed $argv (git-files)
end

# Prints the ID of commit n, where n=1 is the latest commit
function git-cid
	git log --color=never -n $argv[1] | grep "^commit" | awk "{ print \$2 }" | tail -n 1
end

# Compares (diff) two commits.
function git-cc
	git diff (git-cid $argv[1])..(git-cid $argv[2])
end
