#!/bin/sh

export PRIMAL_PRIORITY_RELAYS="wss://relay.primal.net"
export PRIMAL_CACHE_URL="wss://cache2.primal.net/v1"
export PRIMAL_UPLOAD_URL="wss://uploads.primal.net/v1"

printf "\n\n [i] Starting Primal ...\n\n"

exec tini -p SIGTERM -- npm run dev:host
