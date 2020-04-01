# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
if ! [[ "$PATH" =~ "$HOME/.local/bin" ]]; then
	export PATH="$HOME/.local/bin:${PATH}"
fi

export EDITOR="/usr/bin/vim"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

if [ ! -w ${XDG_RUNTIME_DIR:="/run/user/$UID"} ]; then
	echo "\$XDG_RUNTIME_DIR ($XDG_RUNTIME_DIR) not writable. Unsetting." >&2
	unset XDG_RUNTIME_DIR
else
	export XDG_RUNTIME_DIR
fi

# zsh config folder
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# override ~/.vimrc location to work with XDG based specification
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'

# notmuch config file
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch/notmuch-config"

# weechat config folder
export WEECHAT_HOME="$XDG_CONFIG_HOME/weechat"

# Start X server on tty1 only
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx
