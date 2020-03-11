#!/bin/bash
set -euo pipefail

function source_file() {
  echo "$(readlink -f ${BASH_SOURCE[0]})"
}

function source_path() {
  echo "$(dirname $(source_file))"
}

function setup_alias() {
  local run="$(source_file)"

  alias magento="${run} magento"
}

function cli_command() {
  local image="docker.io/agrozyme/magento"
  local command="$(source_path)/docker.do.sh run_command -v ${PWD}:/var/www/html $@ ${image} "
  echo "${command}"
}

function magento() {
  local run="$(cli_command) magento $@"
  ${run}
}

function main() {
  local call=${1:-}

  if [[ -z $(typeset -F "${call}") ]]; then
    return
  fi

  shift
  ${call} "$@"
}

main "$@"
