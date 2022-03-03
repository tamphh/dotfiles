SECRET=$DOTFILES/shell/zsh/secret.zsh
if [ -f "$SECRET" ]; then
  source $SECRET
fi

export GH_AUTH_TOKEN=${GITHUB_TOKEN}
export BUNDLE_GITHUB__COM="${GITHUB_TOKEN}:x-oauth-basic"
export BUNDLE_RUBYGEMS__PKG__GITHUB__COM="${GITHUB_USER}:${GITHUB_TOKEN}"
