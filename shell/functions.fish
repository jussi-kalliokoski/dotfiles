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
