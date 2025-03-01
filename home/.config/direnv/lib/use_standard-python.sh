function use_standard-python() {
    source_up_if_exists

    dotenv_if_exists

    source_env_if_exists .envrc.local

    export VIRTUAL_ENV=$UV_PYENV_ROOT/$(basename "$PWD")/
    export STARSHIP_CONFIG=$HOME/.config/starship/python_aws_terraform.toml
}
