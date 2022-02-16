#!/bin/bash

set -e

SERVICES=(
  force
  gravity
  metaphysics
)

function download() {
  for file in ${SERVICES[@]}; do
      if [[ ! -f "./env/secret/${file}.env" ]]; then
        echo "Downloading '${file}' secrets"
        aws s3 cp --quiet "s3://artsy-citadel/dev/.env.${file}" "./env/secret/${file}.env"
      else
        aws s3 cp --quiet "s3://artsy-citadel/dev/.env.${file}" "/tmp/artsy-local/secret/${file}.env"

        CURRENT_HASH=$(shasum "./env/secret/${file}.env" | cut -f 1 -d ' ')
        NEW_HASH=$(shasum "/tmp/artsy-local/secret/${file}.env" | cut -f 1 -d ' ')

        if [[ "${CURRENT_HASH}" != "${NEW_HASH}" ]]; then
          echo "Refreshing '${file}' secrets"
          mv -f "/tmp/artsy-local/secret/${file}.env" "./env/secret/${file}.env"
        else
          echo "'${file}' secrets up-to-date"
        fi

      fi
  done
  rm -rf "/tmp/artsy-local"
  unset file
}

download
