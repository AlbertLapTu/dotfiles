# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_DISABLE_COMPFIX="true"
# Path to your oh-my-zsh installation.
export ZSH="/Users/atu/.oh-my-zsh"
# source /usr/local/bin/aws_zsh_completer.sh

ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITL="true"
 # Displays working dir as title
 function precmd () {
  window_title="\033]0;${PWD##*/}\007"
  echo -ne "$window_title"
}

DISABLE_UNTRACKED_FILES_DIRTY="true"

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
source /Users/atu/.oh-my-zsh/themes/zsh-theme-gruvbox-material-dark

autoload -U promptinit; promptinit

# Keep 20000 lines of history within shell, and save it to ~/.zsh_history:
HISTSIZE=20000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Default ops allows to find files that end w. certain extension
# More documentation at https://github.com/junegunn/fzf
export FZF_DEFAULT_OPS="--extended"
export FZF_DEFAULT_COCOMMAND="fd --type f"
export NVM_DIR="/Users/atu/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
