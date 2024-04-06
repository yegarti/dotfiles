fish_add_path ~/.cargo/bin

source ~/.autojump/share/autojump/autojump.fish

# make CapsLock behave like Ctrl:
setxkbmap -option ctrl:nocaps

fzf_configure_bindings

begin
	set --local AUTOJUMP_PATH $HOME/.autojump/share/autojump/autojump.fish
	if test -e $AUTOJUMP_PATH
		source $AUTOJUMP_PATH
	end
end

pyenv init - | source
status --is-interactive; and pyenv virtualenv-init - | source

navi widget fish | source
