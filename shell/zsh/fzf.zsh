# fzf keybindings & autocompletion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias fpre="fzf --preview '~/bin/file_preview {}'"

function manpre() {
    man -t $@ | open -f -a "Preview"
}

# ~/.ignore
# ~/projects/.ignore
# export FZF_DEFAULT_COMMAND='ag --nocolor --skip-vcs-ignores --hidden -l -g ""'
# export FZF_DEFAULT_COMMAND='ag --nocolor -l -g ""'
export FZF_DEFAULT_COMMAND='rg --files --follow -g "!.git/*" -g "!node_modules" -g "!tmp/*" -g "!**/*.min.js" -g "!**/*.min.css"'


# fzf Solarized theme
# export FZF_DEFAULT_OPTS='
#   --color=bg+:#073642,bg:#002b36,spinner:#719e07,hl:#719e07
#   --color=fg:#839496,header:#586e75,info:#cb4b16,pointer:#719e07
#   --color=marker:#719e07,fg+:#839496,prompt:#719e07,hl+:#719e07
#   --reverse
#   --cycle
#   --no-bold
#   --no-mouse
#   --preview-window=:hidden
#   --bind ctrl-p:preview-up
#   --bind ctrl-n:preview-down
#   --bind ?:toggle-preview
#   --bind ctrl-f:select-all
#   --bind ctrl-d:deselect-all
# '

# ==========================================
# 1. Base Shared Settings (Always Enabled)
# ==========================================
export FZF_DEFAULT_OPTS='
  --reverse
  --cycle
  --no-bold
  --no-mouse
  --preview-window=:hidden
  --bind ctrl-p:preview-up
  --bind ctrl-n:preview-down
  --bind ?:toggle-preview
  --bind ctrl-f:select-all
  --bind ctrl-d:deselect-all
'

# ==========================================
# 2. Themes (Uncomment ONLY ONE to active)
# ==========================================

# --- Solarized theme ---
# export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS
#   --color=bg+:#073642,bg:#002b36,spinner:#719e07,hl:#719e07
#   --color=fg:#839496,header:#586e75,info:#cb4b16,pointer:#719e07
#   --color=marker:#719e07,fg+:#839496,prompt:#719e07,hl+:#719e07"

# --- Dracula theme ---
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS
  --color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9
  --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9
  --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6
  --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4"


