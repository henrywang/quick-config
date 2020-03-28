#!/usr/bin/env bash

# Make sure script is not run as root or using sudo
if [[ "$(whoami)" == *"root"* ]]; then
    echo "Do not run as root or with sudo"
    exit 1
fi

# folders that should be installed for every setup 
BASE_FOLDERS=(
    bash
    dunst
    fonts
    git
    mbsync
    mutt
    nitrogen
    notmuch
    ranger
    scripts
    sxiv
    systemd
    vim
    wallpaper
    weechat
    xorg
    zathura
    zsh
)

# Make sure the script is run from the quick-config or _setup directories
if [[ -z "${DOTFILES}" ]] || [[ ! -d "${DOTFILES}" ]]; then
    if [[ -d "${HOME}/.quick-config" ]]; then
        STOW_DIR="${HOME}/.quick-config"
    elif [[ $(pwd) =~ "quick-config" ]]; then
        STOW_DIR="$(pwd)"
    elif [[ $(pwd) =~ "_setup" ]]; then
        STOW_DIR="$(dirname "$(pwd)")"
    else
        echo "Cannot find dotfiles directory set DOTFILES variable or run command form dotfiles directory"
        exit 1
    fi
else
    STOW_DIR="${DOTFILES}"
fi

if [[ -z $(whereis stow) ]]; then
    echo "GNU Stow not installed."
    exit 1
fi

# Set basic stow options
CMD_OPTS="--dir=${STOW_DIR} --target=${HOME} -Rv"

# Combine base folders, hostname and setup arguments
ARGUMENTS=("$@")
APPS_LIST=$(printf '%s\n' "${BASE_FOLDERS[@]}" "${ARGUMENTS[@]}" | sort -u )

echo "Stowing apps for user: $(whoami)"

# Install apps for all users
for APP in ${APPS_LIST[@]}; do
    stow ${CMD_OPTS} ${APP}
done

echo "Done: Stowed the following apps:"
echo "${APPS_LIST}"
