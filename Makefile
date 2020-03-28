BLUEHAT=$$HOME/workspace/bluehat

install:
	# ffmpeg requires rpmfusion repo
	sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
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
	mkdir -p $(BLUEHAT)
	mkdir -p $$HOME/.config/vim/{undo,swap,backup}
	mkdir -p $$HOME/.local/share/vim/plugged
	mkdir -p $$HOME/.cache/mutt/{headercache,messagecache,temp}

dwm:
	REPO_FOLDER=$(BLUEHAT)/dwm
	mkdir -p $(REPO_FOLDER)
	git clone -b my_cb3f58 https://github.com/henrywang/dwm.git $(REPO_FOLDER)
	pushd $(REPO_FOLDER)
	sudo make install
	popd

st:
	REPO_FOLDER=$(BLUEHAT)/st
	mkdir -p $(REPO_FOLDER)
	git clone -b my_51e19ea1 https://github.com/henrywang/st.git $(REPO_FOLDER)
	pushd $(REPO_FOLDER)
	sudo make install
	popd

dmenu:
	REPO_FOLDER=$(BLUEHAT)/dmenu
	mkdir -p $(REPO_FOLDER)
	git clone -b my_db6093 https://github.com/henrywang/dmenu.git $(REPO_FOLDER)
	pushd $(REPO_FOLDER)
	sudo make install
	popd

slstatus:
	REPO_FOLDER=$(BLUEHAT)/slstatus
	mkdir -p $(REPO_FOLDER)
	git clone -b my_slstatus https://github.com/henrywang/slstatus.git $(REPO_FOLDER)
	pushd $(REPO_FOLDER)
	sudo make install
	popd

sxlock:
	REPO_FOLDER=$(BLUEHAT)/sxlock
	mkdir -p $(REPO_FOLDER)
	git clone https://github.com/lahwaacz/sxlock.git $(REPO_FOLDER)
	pushd $(REPO_FOLDER)
	sudo make install
	popd

spaceship-prompt:
	REPO_FOLDER=$(BLUEHAT)/spaceship-prompt
	mkdir -p $(REPO_FOLDER)
	git clone https://github.com/denysdovhan/spaceship-prompt.git $(REPO_FOLDER)
	pushd $(REPO_FOLDER)
	ln -sf "$$PWD/spaceship.zsh" "$$HOME/.config/zsh/.zfunctions/prompt_spaceship_setup"
	popd

setup:
	REPO_FOLDER=$$HOME/quick-config
	pushd $(REPO_FOLDER)
	_setup/setup.sh
	popd

power:
	sudo echo 'blacklist e1000e' > /etc/modprobe.d/blacklist-local.conf

nopassword:
	sudo chmod u+w /etc/sudoers
	sudo sed -ie '/^%wheel/a %xiaofwan ALL=(ALL) NOPASSWD: ALL' /etc/sudoers
	sudo chmod u-w /etc/sudoers

printer:
	sudo echo "browsepoll cups.nay.redhat.com" | tee -a /etc/cups/cups-browsed.conf > /dev/null
	sudo echo "localqueuenamingremotecuPS RemoteName" | tee -a /etc/cups/cups-browsed.conf > /dev/null

kerberos:
	sudo cat <<EOT > /etc/krb5.conf
[logging]
 default = FILE:/var/log/krb5libs.log
 kdc = FILE:/var/log/krb5kdc.log
 admin_server = FILE:/var/log/kadmind.log
 
[libdefaults]
 default_realm = REDHAT.COM
 dns_lookup_realm = false
 dns_lookup_kdc = false
 ticket_lifetime = 24h
 renew_lifetime = 7d
 forwardable = true
 
[realms]
 REDHAT.COM = {
   kdc = kerberos01.core.prod.int.phx2.redhat.com.:88
   kdc = kerberos01.core.prod.int.ams2.redhat.com.:88
   kdc = kerberos01.core.prod.int.sin2.redhat.com.:88
   admin_server = kerberos.corp.redhat.com.:749
   default_domain = redhat.com
 }
 
[domain_realm]
 redhat.com = REDHAT.COM
 .redhat.com = REDHAT.COM
EOT

.PHONY: install prepare dwm st dmenu slstatus sxlock spaceship-prompt setup power nopassword printer kerberos
