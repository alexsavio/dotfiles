# ~/.zshrc — lean loader, all config lives in ~/.zsh.d/
for f in ~/.zsh.d/*.zsh(N); do source "$f"; done

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/alexandre/.lmstudio/bin"
# End of LM Studio CLI section


if command -v wt >/dev/null 2>&1; then
  eval "$(command wt config shell init zsh)"
  alias wsc='wt switch --create --execute=claude'
fi

if command -v wt >/dev/null 2>&1; then eval "$(command wt config shell init zsh)"; fi

# bun completions
[ -s "/Users/alexandre/.bun/_bun" ] && source "/Users/alexandre/.bun/_bun"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
