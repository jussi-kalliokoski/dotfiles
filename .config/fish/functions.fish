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

function gls
	git ls-files $argv
end

function git-pick-file -d "Cherry pick commits that have changes to specified files"
	# store current branch
	set branch (git_branch)
	# checkout target branch
	git checkout $argv[1]
	# shift the argv array
	set -e argv[1]
	# store the list of commits containing changes to the specified files
	set commits (git log --pretty="%H" --reverse -- $argv)
	# checkout back to the original branch
	git checkout $branch
	# cherry-pick each stored commit
	for commit in $commits
		git cherry-pick $commit
	end
end

function git-sed -d "Performs a sed operation for all files in the git tree"
	sed $argv (gls)
end

function git-cid -d "Print the ID of the commit n, where n=1 is the latest commit"
	git log --pretty="%H" -n $argv[1] | tail -n 1
end

function git-cc -d "Compare (diff) two commits"
	git diff (git-cid $argv[2])..(git-cid $argv[1])
end
