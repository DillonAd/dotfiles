
### Dotfiles - START ###

unsetopt share_history

export FZF_DEFAULT_OPTS='--layout=reverse --border'

zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

PROMPT="$PROMPT🎲 "

export NODE_PATH=$HOME/.npm/lib/node_modules
export PATH=$PATH:$HOME/.npm/bin
export PATH=$PATH:/opt/homebrew/bin

source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

### Dotfiles - END ###
