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

	if not git diff --quiet HEAD ^&-
		echo "You have uncommitted changes to your dotfiles."
		if prompt "Would you like to commit them in?"; and git commit -a

			git pull --rebase -u origin master
			git push -u origin master
			return 0
		else
			echo "Please commit your local changes before sync."
			cd $old_pwd
			return 1
		end
	end
	git pull
	cd $old_pwd
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
