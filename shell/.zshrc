# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"

# Additional source
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# export ZSH=/Users/tampham/.oh-my-zsh
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="avit"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Running tmnew will check for sessions attached to your current directory,
# if any sessions are found, the session is resumed,
#  otherwise a new session is created where the name is $(pwd).
alias tmnew='tmux new-session -A -s `pwd`'

alias mux="cd ~; tmuxinator"

# font config
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# 10ms for key sequences
KEYTIMEOUT=1
# zsh aliases
alias zshedit="vim ~/.zshrc"
alias zshrefresh="source ~/.zshrc"

# peco aliases
alias files="find . -type file ! -path './.git/*' | peco"

# vim peco aliases
alias filesvim="find . -type file ! -path './.git/*' | peco | xargs -o vim"

# tig aliases
alias tst="tig status"
alias git-reflog='git reflog --pretty=format:" %C(magenta)%h | %gd  %C(#c0d6de)%an  %C(blue)%gs %C(#99bcc9)| %s  %C(yellow)%cr%C(reset)"'

# vim aliases
alias vim_tp="cd ~/github/tp-web; vim"
alias vimrcedit="vim ~/.vimrc"

# git aliases
alias gopull='git pull --rebase origin "$(git_current_branch)"'
alias gopush='git push origin "$(git_current_branch)"'
alias gofetch='git fetch origin "$(git_current_branch)"'
alias gcoi='git checkout $(git branch | fzf --height 50% --border --ansi --tac)'
alias gmi='git merge $(git branch | fzf --height 50% --border --ansi --tac)'

# rspec
alias rspec="bundle exec rspec"
# rake
alias rake="bundle exec rake"
# docker
alias docker-login='$(aws ecr get-login --no-include-email)'
# dotfiles
alias dotfiles="cd ~/.dotfiles"

# bat
# export BAT_THEME="TwoDark"
# https://github.com/braver/Solarized/tree/1.6.0
# https://github.com/sharkdp/bat#adding-new-themes
export BAT_THEME="Solarized (dark)"

# fzf keybindings & autocompletion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias fpre="fzf --preview '~/bin/file_preview {}'"

function manpre() {
    man -t $@ | open -f -a "Preview"
}

# ~/.ignore
# ~/projects/.ignore
# export FZF_DEFAULT_COMMAND='ag --nocolor --skip-vcs-ignores --hidden -l -g ""'
export FZF_DEFAULT_COMMAND='ag --nocolor -l -g ""'

# fzf Solarized theme
export FZF_DEFAULT_OPTS='
  --color=bg+:#073642,bg:#002b36,spinner:#719e07,hl:#719e07
  --color=fg:#839496,header:#586e75,info:#cb4b16,pointer:#719e07
  --color=marker:#719e07,fg+:#839496,prompt:#719e07,hl+:#719e07
  --reverse
  --cycle
  --no-bold
  --no-mouse
  --bind ctrl-p:preview-up
  --bind ctrl-n:preview-down
  --bind ?:toggle-preview
'

# git log show with fzf
gli() {

  # param validation
  if [[ ! `git log -n 1 $@ | head -n 1` ]] ;then
    return
  fi

  # filter by file string
  local filter
  # param existed, git log for file if existed
  if [ -n $@ ] && [ -f $@ ]; then
    filter="-- $@"
  fi

  # git command
  local gitlog=(
    git log
    --graph --color=always
    --abbrev=7
    --pretty=format:"%C(magenta)%h  %C(yellow)%cd    %C(#c0d6de)%an    %C(#99bcc9)%s%C(reset)"
    $@
  )

  # fzf command
  local fzf=(
    fzf
    --ansi --no-sort --reverse --tiebreak=index
    --preview "f() { set -- \$(echo -- \$@ | grep -o '[a-f0-9]\{7\}'); [ \$# -eq 0 ] || git show --color=always \$1 $filter; }; f {}"
    --bind "j:down,k:up,q:abort,ctrl-m:toggle-preview,ctrl-o:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % $filter | less -R') << 'FZF-EOF'
                {}
                FZF-EOF"
   --preview-window=down:60%:hidden
  )

  # piping them
  $gitlog | $fzf
}

# git reflog show with fzf
grli() {
  # git command
  local gitlog=(
    git reflog
    --color=always
    --pretty=format:"%C(magenta)%h | %gd  %C(#c0d6de)%an  %C(blue)%gs %C(#99bcc9)| %s  %C(yellow)%cr%C(reset)"
  )

  # fzf command
  local fzf=(
    fzf
    --ansi --no-sort --reverse --tiebreak=index
    --preview "f() { set -- \$(echo -- \$@ | grep -o '[a-f0-9]\{7\}'); [ \$# -eq 0 ] || git show --color=always \$1; }; f {}"
    --bind "j:down,k:up,q:abort,ctrl-m:toggle-preview,ctrl-o:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
                FZF-EOF"
   --preview-window=down:60%:hidden
  )

  # piping them
  $gitlog | $fzf
}

export EDITOR='vim'
export ANDROID_HOME=/Users/$USER/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

export PATH=$PATH:/usr/local/sbin

export TERM=xterm-256color

export PATH="$HOME/.cargo/bin:$PATH"

# export PATH="$(brew --prefix qt@5.5)/bin:$PATH"

export GREP_COLOR='00;33'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Front-end configs
export CXXFLAGS="-mmacosx-version-min=10.9"

export LDFLAGS="-mmacosx-version-min=10.9"

