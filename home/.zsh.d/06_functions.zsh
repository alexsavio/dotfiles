# Shell functions

# --- Git worktree helpers ---

# Create a new worktree and branch from within current git directory
gwa() {
  if [[ -z "$1" ]]; then
    echo "Usage: gwa <branch-name>"
    return 1
  fi
  local branch="$1"
  local base="$(basename "$PWD")"
  local target="../${base}--${branch}"

  git worktree add -b "$branch" "$target"
  mise trust "$target"
  cd "$target"
}

# Remove worktree and branch from within active worktree directory
gwd() {
  if gum confirm "Remove worktree and branch?"; then
    local cwd worktree root branch
    cwd="$(pwd)"
    worktree="$(basename "$cwd")"
    root="${worktree%%--*}"
    branch="${worktree#*--}"

    if [[ "$root" != "$worktree" ]]; then
      cd "../$root"
      git worktree remove "$worktree" --force
      git branch -D "$branch"
    fi
  fi
}

# --- Docker functions ---

dssh()  { docker exec -i -t "$1" /bin/bash; }
dstop() { docker stop $(docker ps -a -q); }
dckrm() { docker rm $(docker ps -a -q); }
dri()   { docker rmi $(docker images -q); }
dbu()   { docker build -t="$1" .; }
dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }

docker-clean() {
  docker rmi -f $(docker images -q -a -f dangling=true)
}

docker-cleanall() {
  docker rm -v $(docker ps -a -q -f status=exited)
  docker-clean
  docker run -v /var/run/docker.sock:/var/run/docker.sock \
    -v /var/lib/docker:/var/lib/docker --rm martin/docker-cleanup-volumes
}

# --- Direnv helper ---

dotenv_if_exists() {
  local path=${1:-}
  if [[ -z $path ]]; then
    path=$PWD/.env
  elif [[ -d $path ]]; then
    path=$path/.env
  fi
  watch_file "$path"
  if ! [[ -f $path ]]; then
    return
  fi
  eval "$("$direnv" dotenv bash "$@")"
}
