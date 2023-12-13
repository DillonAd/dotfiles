
### Dotfiles - START ###

unsetopt share_history

export FZF_DEFAULT_OPTS='--layout=reverse --border'

zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

PROMPT="$PROMPT🎲 "

export NODE_PATH=$HOME/.npm/lib/node_modules
export PATH=$PATH:$HOME/.npm/bin

eval "$(pyenv init -)"

source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

ssh-add ~/.ssh/id_github > /dev/null 2>&1
ssh-add ~/.ssh/id_gcp > /dev/null 2>&1

### Dotfiles - END ###
