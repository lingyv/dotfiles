# Keep PATH unique in zsh (important when tmux/server environment reuses PATH).
typeset -U path PATH

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don't want to commit.
# removed bash_prompt from default setting. we use didferent bash prompt
for file in ~/.{exports,aliases,functions,secret_config,env}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Load NVM if installed
if [ -d "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
fi

# Final PATH dedupe after all sourced files potentially append/prepend entries.
typeset -U path PATH