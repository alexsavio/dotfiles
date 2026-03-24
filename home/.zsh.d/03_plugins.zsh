# Plugins — plain git clones in ~/.zsh/plugins/

local plugin_dir="$HOME/.zsh/plugins"

# Autosuggestions
[[ -d "$plugin_dir/zsh-autosuggestions" ]] && \
  source "$plugin_dir/zsh-autosuggestions/zsh-autosuggestions.zsh"

# History substring search (used by keybindings in 01_options.zsh)
[[ -d "$plugin_dir/zsh-history-substring-search" ]] && \
  source "$plugin_dir/zsh-history-substring-search/zsh-history-substring-search.zsh"

# Fast syntax highlighting (must be last plugin)
[[ -d "$plugin_dir/fast-syntax-highlighting" ]] && \
  source "$plugin_dir/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
