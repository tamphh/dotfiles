# dotfiles
This is the git repository for my dotfiles.

# Used tool
stow

# Quick start
- Cd to dotfiles folder. For example: ```cd ~/dotfiles```
- Run git clone https://github.com/tamphh/dotfiles.git
- Install brew
- Install stow: ```brew install stow```
- Run setup.sh
- Optional: ```mv ~/dotfiles ~/.dotfiles``` if it's needed to be made hidden.

# How to run .sh files
- Navigate to the directory of the file. 

- Run "chmod +x filename.sh" to make the script executable. 

- Then run "./filename.sh" to activate the script.

# How to run .rb files
- Navigate to the directory of the file. 
- Execute ```ruby filename.rb```.

# Additional configs
Ag ignores:
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
# Additional configs for some Mac apps
iTerm2 tmux copy mode: Enable clipboard access 
