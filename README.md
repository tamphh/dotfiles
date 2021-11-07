# dotfiles
This is the git repository for my dotfiles.

# Used tool
stow

# Quick start
- Install brew
- Install zsh
- Install git
- Run git clone https://github.com/tamphh/dotfiles.git
- Cd to dotfiles folder. For example: ```cd ~/dotfiles```
- Install stow: ```brew install stow```
- Run ```./setup.sh``` to execute script
- Optional: ```mv ~/dotfiles ~/.dotfiles``` if it's needed to be made hidden.
- Run ```brew_bootstrap.sh``` to install brew packages

# How to run .sh files
- Navigate to the directory of the file. 

- Execute ```chmod +x filename.sh``` to make the script executable. 

- Then ```./filename.sh``` to activate the script.

# How to run .rb files
- Navigate to the directory of the file. 
- Execute ```ruby filename.rb```.

# Additional configs
### ```Ag``` ignores:
  ```node_modules
  public
  .git
  tmp/
  *.cache
  *.json
  tps-main.js
  *.min.*
  *min.js
  ```

### ```fzf``` keybindings & autocompletion
Source: https://github.com/junegunn/fzf#using-homebrew-or-linuxbrew
```sh
# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install
```

### git ```diff-highlight``` on Ubuntu
source: [Pass the path to git diff-highlight on Ubuntu 18.04 (link)](https://qiita.com/SakaiYuki/items/2814d417d0bec59046bb)

**Link ```diff-highlight```**
```sh
sudo chmod +x /usr/share/doc/git/contrib/diff-highlight/diff-highlight
sudo ln -s /usr/share/doc/git/contrib/diff-highlight/diff-highlight /usr/local/bin/diff-highlight
```
**If you upgrade git after Link**

Add only execute permission again
```sh
sudo chmod +x /usr/share/doc/git/contrib/diff-highlight/diff-highlight
```
# Additional configs for some Mac apps
iTerm2 tmux copy mode: ```Enable clipboard access```
