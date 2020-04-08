#!/usr/bin/env bash

function go_to_project_top_directory() {
  local -r script_dir=$(dirname "${BASH_SOURCE[0]}")

  cd "$script_dir/../../.." || exit 1
}

function main() {
  go_to_project_top_directory
  source ./scripts/shared/shared.sh || exit 1
  shared.set_bash_error_handling

  ./platforms/xcode/scripts/lint.sh
  ./platforms/xcode/scripts/test.sh
  ./platforms/xcode/scripts/test-carthage-build.sh

  shared.display_success_message "Xcode validation completed successfully 🧪"
}

main
