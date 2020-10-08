#!/bin/sh

if [ -d "${CONFIG_DIR}" ]; then
  USER_NAME="user"
  USER_HOME="/home/${USER_NAME}"
  CONFIG_DIR="${USER_HOME}/.config/scalingo"

  # Create user and group with same uid/gid as config dir owner (usually the host system user)
  addgroup -g $(stat -c '%g' "${CONFIG_DIR}") "${USER_NAME}"
  adduser -u $(stat -c '%u' "${CONFIG_DIR}") -G "${USER_NAME}" -h "${USER_HOME}" "${USER_NAME}"
  su-exec "${USER_NAME}" "$@"
else
  eval "$@"
fi
