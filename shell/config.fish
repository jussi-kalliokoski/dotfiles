set -x LANG en_US.UTF-8
set -x LESS "-EQRX"
set -x EDITOR "vim"
set -x BROWSER "open"

function git_info
	git diff --quiet HEAD ^&-
	if test $status = 1
		echo '*'
	end
end

function git_branch
	git branch --color=never ^&- | awk '/\*/ {print $2}'
end

function fish_prompt
	set_color --bold blue
	echo -n '['
	set_color --bold white
	echo -n (prompt_pwd)
	set_color --bold blue
	echo -n '] - ['
	set_color --bold purple
	echo -n '$'
	set_color --bold blue
	echo -n '] <'
	echo -n (git_branch)
	echo -n (git_info)
	set_color --bold blue
	echo -n '> '
	set_color normal
end

set PATH ~/.rvm/bin /usr/local/share/npm/bin /usr/local/bin /usr/local/sbin /usr/bin /bin /usr/sbin /sbin
