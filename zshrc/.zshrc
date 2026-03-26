# fastfetch
fastfetch

# Installation of ZINIT plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[[ ! -d $ZINIT_HOME ]] && mkdir -p "$(dirname $ZINIT_HOME)"
[[ ! -d $ZINIT_HOME/.git ]] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Bind keys to vim keys
bindkey -v

# Plugins
zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions

source <(fzf --zsh)

# Aliases
alias vim="nvim"
if [[ $TERM == "xterm-kitty" ]]; then
    alias ssh="kitten ssh"
fi

# node version manager
[[ -s $NVM_DIR/nvm.sh ]] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -s $NVM_DIR/bash_completion ]] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[[ -s $HOME/.bun/_bun ]] && source "$HOME/.bun/_bun"

# homebrew
if [[ -d /home/linuxbrew ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv zsh)"
fi

# chpwd hooks
autoload -Uz add-zsh-hook
python_hook() {
    if [[ -d .venv ]]; then
        source .venv/bin/activate
    elif [[ -d venv ]]; then
        source venv/bin/activate
    elif [[ -n $VIRTUAL_ENV ]]; then
        deactivate
    fi
}

ls_hook() {
    ls
}

add-zsh-hook chpwd python_hook
add-zsh-hook chpwd ls_hook
