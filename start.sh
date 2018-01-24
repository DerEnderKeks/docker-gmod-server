#!/usr/bin/env bash

# Check if some can't read and tried to execute this script outside of Docker
if [ "$ISDOCKER" != "true" ]; then
  echo "This script is executed inside the Docker container and shouldn't be used on the host system..."
  exit 1
fi

# Mount UnionFS
unionfs-fuse -o cow /gmod-volume=RW:/gmod-base=RO /gmod-union

# Start Server
/gmod-union/srcds_run -game garrysmod -norestart -port ${PORT} +maxplayers ${MAXPLAYERS} +hostname "${SERVERNAME}" +gamemode ${GAMEMODE} "${ARGS}" +map ${MAP}
