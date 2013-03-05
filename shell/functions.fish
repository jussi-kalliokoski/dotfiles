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

function gw
	git whatchanged $argv
end

# Performs a sed operation for all files in the git tree
function git-sed
	sed $argv (git ls-files)
end

# Prints the ID of commit n, where n=1 is the latest commit
function git-cid
	git log --pretty="%H" | head -n $argv[1] | tail -n 1
end

# Compares (diff) two commits.
function git-cc
	git diff (git-cid $argv[1])..(git-cid $argv[2])
end
