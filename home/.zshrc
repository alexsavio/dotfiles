# ~/.zshrc — lean loader, all config lives in ~/.zsh.d/
for f in ~/.zsh.d/*.zsh(N); do source "$f"; done

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/alexandre/.lmstudio/bin"
# End of LM Studio CLI section


if command -v wt >/dev/null 2>&1; then
  alias wsc='wt switch --create --execute=claude'
fi

# Docker runs in colima; SDKs (bollard, docker-py) ignore docker contexts
export DOCKER_HOST="unix://$HOME/.colima/default/docker.sock"
# Testcontainers' Ryuk mounts the socket path inside the colima VM
export TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE=/var/run/docker.sock
