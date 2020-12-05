echo "Starting brew bootstrapping"

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
echo "brew updating..."
brew update

# Install GNU core utilities (those that come with OS X are outdated)
echo "brew core utlis installing..."
brew tap homebrew/dupes
brew install coreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils
# Install Bash 4
brew install bash

# Install universal-ctags
brew install --HEAD universal-ctags/universal-ctags/universal-ctags

# Install lazygit
brew tap jesseduffield/lazygit
brew install jesseduffield/lazygit/lazygit

# Needed packages
PACKAGES=(
    git
    ag
    ripgrep
    python
    python3
    stow
    tree
    tmux
    tig
    vim
    neovim
    peco
    vifm
    bat
    fzf
)
echo "Installing needed packages..."
brew install ${PACKAGES[@]}

#Python3 interface with pip:
pip3 install neovim

echo "Cleaning up..."
brew cleanup

# Install casks
brew install caskroom/cask/brew-cask
CASKS=(
    iterm2
    alacritty
    kitty
    rectangle
    the-unarchiver
    appcleaner
    mark-text
    sublime-text
    visual-studio-code
    notion
)
echo "Installing cask apps..."
brew cask install ${CASKS[@]}

# Install fonts
# brew tap caskroom/fonts
brew tap homebrew/cask-fonts
FONTS=(
    font-source-code-pro
    font-roboto
    font-hack
    font-iosevka
    font-hurmit-nerd-font
)
# extra fonts not found by brew
# https://pcaro.es/p/hermit
echo "Installing fonts..."
brew cask install ${FONTS[@]}

echo "Done"
