
# Keep PATH unique in zsh (important when tmux/server environment reuses PATH).
typeset -U path PATH


# Added by Toolbox App
export PATH="$PATH:/Users/lingyv/Library/Application Support/JetBrains/Toolbox/scripts"


# Added by OrbStack: command-line tools and integration
source ~/.orbstack/shell/init.zsh 2>/dev/null || :

# From ~/.bash_profile (for zsh login shells)
# Run brew from $HOME so startup doesn't fail when current dir is restricted.
if [ -x /opt/homebrew/bin/brew ]; then
  __orig_pwd="$PWD"
  builtin cd "$HOME" 2>/dev/null || true
  eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null)"
  builtin cd "$__orig_pwd" 2>/dev/null || true
  unset __orig_pwd
fi

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"

source /opt/homebrew/opt/nvm/nvm.sh

# Final PATH dedupe after all sourced files potentially append/prepend entries.
typeset -U path PATH
