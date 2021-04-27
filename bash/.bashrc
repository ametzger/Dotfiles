# -*- shell-script -*-

HOMEBREW_PREFIX="$(brew --prefix 2>/dev/null || true)"
[ -n "$HOMEBREW_PREFIX" ] || HOMEBREW_PREFIX="/usr/local"
[ -d "$HOMEBREW_PREFIX" ] || sudo mkdir -p "$HOMEBREW_PREFIX"

export PATH=$HOME/bin:$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin:$PATH 

if [ -r /etc/bashrc ]; then
    . /etc/bashrc
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export PATH="~/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export DIRENV_LOG_FORMAT=''
eval "$(direnv hook bash)"
