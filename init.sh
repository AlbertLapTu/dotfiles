#!/bin/bash

# homebrew
if [[ ! $(which brew) ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

brew update

# brew taps
brew tap homebrew/cask-fonts

# package list
PACKAGES=(
  cask
  fzf
  wget
  zsh
  git
  jq
  npm
  node
  python3
  vim
  github/gh/gh
  nvm
)

echo "Installing packages..."
brew install ${PACKAGES[@]}

# application list
# https://formulae.brew.sh/cask/
APPLICATIONS=(
  google-chrome
  iterm2
  alfred
  coconutbattery
  itsycal
  visual-studio-code
  google-backup-and-sync
  slack
  vlc
  notion
  spotify
)

echo "Installing applications..."
brew cask install ${APPLICATIONS[@]}

FONTS=(
  font-inconsolata
  font-roboto-mono
)

echo "Installing fonts..."
brew cask install ${FONTS[@]}

echo "Configuring OSX..."
# Show filename extensions by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

#Enable tap-to-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

#Make dock faster
defaults write com.apple.dock springboard-show-duration -int 0;killall Dock
defaults write com.apple.dock springboard-hide-duration -int 0;killall Dock

echo "Setting zsh..."
# zsh
# TODO: Replace with vim plug git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
# TODO: zsh git, zsh osx, zsh x and zsh npm
npm install --global pure-prompt

cp zshrc ~/.zshrc
source ~/.zshrc

echo "Downloading iterm theme..."
wget https://raw.githubusercontent.com/JonathanSpeek/palenight-iterm2/master/palenight.itermcolors

echo "Setting vim..."
#vim
cp vimrc ~/.vimrc
source ~/.vimrc

