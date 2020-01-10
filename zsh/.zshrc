# -*- shell-script -*-
## Read for interactive shells

# Handle dumb terms
[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return

## profiling: uncomment to enable profiling
# zmodload zsh/datetime
# setopt PROMPT_SUBST
# PS4='+$EPOCHREALTIME %N:%i> '

# logfile=$(mktemp zsh_profile.XXXXXXXX)
# echo "Logging to $logfile"
# exec 3>&2 2>$logfile

# setopt XTRACE
# zmodload zsh/zprof

export LSCOLORS='exfxcxdxbxegedabagacad'
export CLICOLOR=true

## force readline keybinds
bindkey -e

## Pure prompt
export PURE_GIT_PULL=0

## antigen
# To manage plugins, update `zsh.d/plugins.txt` then run `bin/antigen`
# to regenerate this file.
source ~/.zsh.d/plugins.zsh

autoload -U compinit && compinit

## aliases
if command -v exa >/dev/null 2>&1; then
  alias ls='exa'
  alias ll='exa -lah'
fi

if command -v bat >/dev/null 2>&1; then
  export BAT_THEME="ansi-dark"
  alias cat='bat'
fi

alias em='emacsclient -nc'
alias e='emacsclient -nw'
alias vim='nvim'
alias p='pipenv run'
# alias m='p python manage.py'
alias sp='m shell_plus'
alias tf='terraform'

## tools
if command -v rbenv >/dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

if command -v direnv >/dev/null 2>&1; then
  export DIRENV_LOG_FORMAT=''
  eval "$(direnv hook zsh)"
fi

if [[ -d $NVM_DIR ]]; then
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
fi

[ -f $HOME/.fzf.zsh ] && source ~/.fzf.zsh

## extra env vars
[ -f $HOME/.localrc ] && source ~/.localrc

# More profiling, see top of file
# unsetopt XTRACE
# exec 2>&3 3>&-
