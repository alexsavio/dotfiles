# Shell options, history, and keybindings

# Navigation
setopt AUTO_CD AUTO_PUSHD AUTO_NAME_DIRS PUSHD_MINUS PUSHD_TO_HOME PUSHD_IGNORE_DUPS

# Globbing
setopt GLOB_COMPLETE NO_CASE_GLOB NUMERIC_GLOB_SORT EXTENDED_GLOB RC_EXPAND_PARAM

# Safety & misc
setopt MULTIOS RM_STAR_WAIT NO_HUP IGNORE_EOF NO_FLOW_CONTROL NO_CLOBBER

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt EXTENDED_HISTORY SHARE_HISTORY HIST_IGNORE_DUPS HIST_IGNORE_SPACE HIST_REDUCE_BLANKS

# Keybindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char
