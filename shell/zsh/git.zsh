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


# useful for daily stand-up
git-standup() {
    AUTHOR=${AUTHOR:="`git config user.name`"}

    since=yesterday
    if [[ $(date +%u) == 1 ]] ; then
        since="2 days ago"
    fi

    git log --all --since "$since" --oneline --author="$AUTHOR"
}
