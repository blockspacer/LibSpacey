#!/usr/bin/env bash

function go_to_project_top_directory() {
  local -r script_dir=$(dirname "${BASH_SOURCE[0]}")

  cd "$script_dir/../.." || exit 1
}

function lint_typescript() {
  pushd typescript || exit 1
  npm run lint
  popd || exit 1
}

function main() {
  go_to_project_top_directory
  source ./scripts/shared/shared.sh || exit 1
  shared.set_bash_error_handling

  lint_typescript

  shared.display_success_message "Typescript linter ran successfully 🧹"
}

main
