# dotfiles
This is the git repository for my dotfiles.

# Used tool
stow

# Quick start
- Cd to dotfiles folder. For example: ```cd ~/dotfiles```
- Run git clone https://github.com/tamphh/dotfiles.git
- Install brew
- Install stow: ```brew install stow```
- Run ```./setup.sh``` to execute script
- Optional: ```mv ~/dotfiles ~/.dotfiles``` if it's needed to be made hidden.

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
# Additional configs for some Mac apps
iTerm2 tmux copy mode: ```Enable clipboard access```
