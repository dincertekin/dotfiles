# Created by dincertekin for 5.9

# Load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# CTRL+LEFT and CTRL+RIGHT arrow keys
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Customized prompt
PROMPT='%F{green}[%n@%m]%f %F{blue}%~ %#%f '
