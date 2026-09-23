#!/usr/bin/env bash

set -euo pipefail

clear

# --------------------------------------------------
# User / home directory
# --------------------------------------------------

username="${SUDO_USER:-$USER}"
user_home="$(getent passwd "$username" | cut -d: -f6)"

if [[ -z "$user_home" || ! -d "$user_home" ]]; then
    echo "ERROR: Could not determine home directory for $username."
    exit 1
fi

echo "User: $username"
echo "Home: $user_home"
echo

# --------------------------------------------------
# Helper functions
# --------------------------------------------------

create_directory() {
    local directory="$1"

    if [[ ! -d "$directory" ]]; then
        echo "Creating directory: $directory"
        mkdir -p "$directory"
    else
        echo "Directory already exists: $directory"
    fi
}

install_config() {
    local source="$1"
    local destination="$2"

    if [[ ! -f "$source" ]]; then
        echo "WARNING: Source file does not exist:"
        echo "  $source"
        return 0
    fi

    create_directory "$(dirname "$destination")"

    if [[ -f "$destination" ]]; then
        echo "Backing up existing config:"
        echo "  $destination"

        cp -a "$destination" "${destination}.backup"
    fi

    echo "Installing:"
    echo "  $source"
    echo "→ $destination"

    cp -a "$source" "$destination"
}

# --------------------------------------------------
# Start installation
# --------------------------------------------------

echo "The script will now update the system and install tools."
sleep 2

clear

echo "Updating system..."
sudo pacman -Syu --noconfirm

echo
echo "System update complete."
