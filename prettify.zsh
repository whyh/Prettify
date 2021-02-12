#!/bin/zsh

DEFAULT_CONFIG_PATH="$/Users/daniel/PassionProjects/Prettify/setup.cfg"
CONFIG_PATH="$(pwd)/setup.cfg"
VENV_PATH="$(pwd)/venv"
MYPY_CACHE_PATH="$(pwd)/.mypy_cache"

run_verbose() {
  OUTPUT="$(eval "$*")"
  if [ -n "$OUTPUT" ]; then
    printf "%s\n\033[0;31m%s\n\033[0m" "% $*" "$OUTPUT"
  fi
}

format() {
  run_verbose python -m autoflake --in-place --remove-all-unused-imports --ignore-init-module-imports "$1"
  run_verbose python -m isort --settings-path="$CONFIG_PATH" --virtual-env="$VENV_PATH" "$1"
  run_verbose python -m black -l 160 --quiet "$1"
  run_verbose python -m flake8 --config="$CONFIG_PATH" "$1"
  run_verbose python -m mypy --config-file="$CONFIG_PATH" --cache-dir="$MYPY_CACHE_PATH" --show-traceback --no-error-summary "$1"
}

if [ -z "$1" ]; then
  echo "Please specify file or directory to format"
  exit 2
fi

if [ ! -f "$CONFIG_PATH" ]; then
    echo "setup.cfg not found in the project. Using default $DEFAULT_CONFIG_PATH"
    CONFIG_PATH="$DEFAULT_CONFIG_PATH"
fi

source "./venv/bin/activate"
pip install --upgrade --quiet autoflake isort black flake8 mypy

if [ -f "$1" ]; then
  format "$1"
else
  cd "$1/" || exit 2
  for FILE_PATH in **/*.py; do
    format "$FILE_PATH"
  done
fi
