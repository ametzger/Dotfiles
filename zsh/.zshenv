# -*- shell-script -*-
## Read for all shells: minimize time-consuming stuff in here.

# rbenv
if [[ -d ~/.rbenv ]]; then
  export RBENV_ROOT="$HOME/.rbenv"
  export PATH="$RBENV_ROOT/bin:$PATH"
fi

# pyenv
if [[ -d ~/.pyenv ]]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH"
fi

# nvm
if [[ -d ~/.nvm ]]; then
  export NVM_DIR="$HOME/.nvm"
fi

# golang
if [[ -d ~/proj/go ]]; then
  export GOPATH="$HOME/proj/go"
  export PATH="$GOPATH/bin:$PATH"
fi

# rust
if [[ -d ~/.cargo ]]; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

if [[ -d ~/.tfenv ]]; then
  export PATH="$HOME/.tfenv/bin:$PATH"
fi

if [[ -d ~/.node-versions ]]; then
  export NODE_VERSIONS="$HOME/.node-versions"
fi

## editor
export EDITOR='nvim'
export VISUAL='nvim'

## less
# show colors
export LESS="-R"

## various config
export SSH_KEY_PATH="$HOME/.ssh/rsa_id"
export DOTNET_CLI_TELEMETRY_OPTOUT=true
export PYTHONIOENCODING='UTF-8'
export DOCKER_BUILDKIT=1
export DOCKER_SCAN_SUGGEST=false

## platform-specific
OS=$(uname -s); export OS
if [[ -f ~/.zsh.d/zsh.${OS} ]]; then
    source ~/.zsh.d/zsh.${OS}
fi

## $PATH manipulation
# This should go last, prefer stuff in here to pyenv/rbenv/whatever
if [[ -d ~/bin ]]; then
  export PATH="$HOME/bin:$PATH"
fi

if [[ -d ~/.local/bin ]]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ '
[[ ! $TERM == "dumb" ]] && TERM=xterm-256color
