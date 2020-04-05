BLUEHAT=$$HOME/workspace/bluehat

install:
	# ffmpeg requires rpmfusion repo
	sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(shell rpm -E %fedora).noarch.rpm
	sudo dnf -y install zsh zsh-syntax-highlighting zsh-autosuggestions fzf ripgrep lsd \
		xorg-x11-server-Xorg xorg-x11-xinit libX11-devel libXft-devel libXinerama-devel \
		langpacks-zh_CN xbacklight dunst pulseaudio pulseaudio-utils alsa-plugins-pulseaudio \
		alsa-utils sxiv zathura zathura-pdf-mupdf ranger cmake gcc-c++ make python3-devel \
		vim weechat mutt git curl wget xclip isync notmuch notmuch-mutt khard stow lynx \
		NetworkManager-wifi NetworkManager-openvpn openvpn firefox chromium pavucontrol \
		krb5-workstation ffmpeg git patchutils schroot mock strace ShellCheck tigervnc \
		qemu-kvm qemu-img rsync unzip zip bzip2 lsof gnupg2 tree ansible bc pciutils \
		mesa-dri-drivers jq podman

prepare:
	mkdir -p $$HOME/Contacts/redhat
	mkdir -p $(BLUEHAT)
	mkdir -p $$HOME/.config/vim/{undo,swap,backup}
	mkdir -p $$HOME/.local/share/vim/plugged
	mkdir -p $$HOME/.cache/mutt/{headercache,messagecache,temp}

spaceship-prompt:
	REPO_FOLDER=$(BLUEHAT)/spaceship-prompt
	mkdir -p $(REPO_FOLDER)
	git clone https://github.com/denysdovhan/spaceship-prompt.git $(REPO_FOLDER)
	pushd $(REPO_FOLDER)
	ln -sf "$$PWD/spaceship.zsh" "$$HOME/.config/zsh/.zfunctions/prompt_spaceship_setup"
	popd

zsh-nvm:
	mkdir -p $$HOME/workspace/bluehat/zsh-nvm
	git clone https://github.com/lukechilds/zsh-nvm.git $$HOME/workspace/bluehat/zsh-nvm

setup:
	REPO_FOLDER=$$HOME/quick-config
	pushd $(REPO_FOLDER)
	_setup/setup.sh
	popd

power:
	sudo echo 'blacklist e1000e' > /etc/modprobe.d/blacklist-local.conf

.PHONY: install prepare spaceship-prompt zsh-nvm setup power
