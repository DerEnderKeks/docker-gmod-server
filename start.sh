#!/usr/bin/env bash

if [ "$ISDOCKER" != "true" ]; then
  echo "This script is executed inside the Docker container and shouldn't be used on the host system..."
  exit 1
fi

function startServer {
  "$1/srcds_run" -game garrysmod -norestart -port ${PORT} +maxplayers ${MAXPLAYERS} +hostname "${SERVERNAME}" +gamemode ${GAMEMODE} "${ARGS}" +map ${MAP}
}

if [ -n "$UNION" ]; then
  unionfs-fuse -o cow -o allow_other /gmod-volume=RW:/gmod-base=RO /gmod-union
  startServer("/gmod-union")
else
  startServer("/gmod-base")
fi