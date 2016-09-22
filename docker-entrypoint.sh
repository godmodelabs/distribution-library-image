#!/bin/sh

set -e

# check if we should run update-ca-certificates
mount | grep -qE '/usr/local/share/ca-certificates/.+' && update-ca-certificates --fresh

case "$1" in
    *.yaml|*.yml) set -- registry serve "$@" ;;
    serve|garbage-collect|help|-*) set -- registry "$@" ;;
esac

exec "$@"
