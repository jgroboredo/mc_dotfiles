#!/bin/bash

shopt -s dotglob

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

for file in "${SCRIPT_DIR}/bin"/*; do
  temp=$(basename "${file}")
  echo "$file"
  cp "${file}" /usr/bin/
  chmod +x /usr/bin/${temp}
  chmod +r /usr/bin/${temp}
done
