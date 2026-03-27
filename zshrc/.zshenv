# Environment variables
export EDITOR=nvim
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export GPG_TTY=$(tty)

# Go installation
export GOPATH="$HOME/go"

# Node version manager
export NVM_DIR="$HOME/.config/nvm"

# ZK Notes
if command -v zk &>/dev/null; then
    export ZK_NOTEBOOK_DIR="$HOME/Notes"
fi

# Add local bin to PATH
export PATH="$PATH:$HOME/.local/bin"

# Cargo
export PATH="$PATH:$HOME/.cargo/bin"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Android AVD Home
export ANDROID_AVD_HOME="$HOME/.config/.android/avd"

# Add Flutter and Android SDK to PATH
export PATH="$HOME/develop/flutter/bin:$PATH"
export PATH="$HOME/develop/android_sdk/cmdline-tools/latest/bin/:$PATH"
export PATH="$HOME/develop/android_sdk/platform-tools/:$PATH"
export PATH="$HOME/develop/android_sdk/emulator/:$PATH"

