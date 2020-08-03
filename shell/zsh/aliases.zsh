# tmux
alias tmnew='tmux new-session -A -s `pwd`'
alias mux="cd ~; tmuxinator"

# zsh aliases
alias zshedit="vim ~/.zshrc"
alias zshrefresh="source ~/.zshrc"

# peco aliases
alias files="find . -type file ! -path './.git/*' | fzf"

# vim peco aliases
alias filesvim="find . -type file ! -path './.git/*' | fzf | xargs -o vim"

# tig aliases
alias tst="tig status"
alias git-reflog='git reflog --pretty=format:" %C(magenta)%h | %gd  %C(#c0d6de)%an  %C(blue)%gs %C(#99bcc9)| %s  %C(yellow)%cr%C(reset)"'

# vim aliases
alias vim_tp="cd ~/github/tp-web; vim"
alias vimrcedit="vim ~/.vimrc"

# git aliases
alias gco='git checkout'
alias gst='git status'
alias gpullrb='git pull --rebase origin "$(git_current_branch)"'
alias gopull='git pull origin "$(git_current_branch)"'
alias gopush='git push origin "$(git_current_branch)"'
alias gofetch='git fetch origin "$(git_current_branch)"'
alias gcoi='git checkout $(git branch | fzf --height 50% --border --ansi --tac)'
alias gmi='git merge $(git branch | fzf --height 50% --border --ansi --tac)'
alias lg='lazygit'

# rspec
alias rspec="bundle exec rspec"
# rake
alias rake="bundle exec rake"
# docker
alias docker-login='$(aws ecr get-login --no-include-email)'
# dotfiles
alias dotfiles="cd ~/.dotfiles"
