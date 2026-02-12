
# Keep PATH unique in zsh (important when tmux/server environment reuses PATH).
typeset -U path PATH


# Added by Toolbox App
export PATH="$PATH:/Users/lingyv/Library/Application Support/JetBrains/Toolbox/scripts"


# Added by OrbStack: command-line tools and integration
source ~/.orbstack/shell/init.zsh 2>/dev/null || :

# From ~/.bash_profile (for zsh login shells)
eval $(/opt/homebrew/bin/brew shellenv)

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
# removed bash_prompt from default setting. we use didferent bash prompt
for file in ~/.{exports,aliases,functions,secret_config,env}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

source /opt/homebrew/opt/nvm/nvm.sh

# Final PATH dedupe after all sourced files potentially append/prepend entries.
typeset -U path PATH
