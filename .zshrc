ZSH_DISABLE_COMPFIX="true"
# Path to your oh-my-zsh installation.
export ZSH="/Users/atu/.oh-my-zsh"
# source /usr/local/bin/aws_zsh_completer.sh

ZSH_THEME=""

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITL="true"
 # Displays working dir as title
 function precmd () {
  window_title="\033]0;${PWD##*/}\007"
  echo -ne "$window_title"
}

DISABLE_UNTRACKED_FILES_DIRTY="true"

# Load zsh plugins
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  npm
  osx
  z
)


source $ZSH/oh-my-zsh.sh
source /usr/local/bin/aws_zsh_completer.sh
source ~/.profile
source ~/.aliases

autoload -U promptinit; promptinit
prompt pure


# Keep 20000 lines of history within shell, and save it to ~/.zsh_history:
HISTSIZE=20000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='vim'
# fi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Default ops allows to find files that end w. certain extension
# More documentation at https://github.com/junegunn/fzf
export FZF_DEFAULT_OPS="--extended"
# Fzf uses unix find underneith the hood. Use Fd as third party finder to ignore
# all files specificied by .gitignore
export FZF_DEFAULT_COCOMMAND="fd --type f"

export NVM_DIR="/Users/atu/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
