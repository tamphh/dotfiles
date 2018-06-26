echo "Starting brew bootstrapping"

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

# Install GNU core utilities (those that come with OS X are outdated)
brew tap homebrew/dupes
brew install coreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils
# Install Bash 4
brew install bash

# Install universal-ctags
brew install --HEAD universal-ctags/universal-ctags/universal-ctags

# Needed packages
PACKAGES=(
    ag
    python
    python3
    stow
    tree
    tmux
    tig
    vim
    neovim
)
echo "Installing packages..."
brew install ${PACKAGES[@]}

echo "Cleaning up..."
brew cleanup

echo "Installing cask..."
brew install caskroom/cask/brew-cask
CASKS=(
    iterm2
)
echo "Installing cask apps..."
brew cask install ${CASKS[@]}

echo "Done"
