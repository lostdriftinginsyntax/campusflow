#!/bin/bash
export ELECTRON_RUN_AS_NODE=1
export PORT=${PORT:-3000}

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "Starting CampusFlow Server on http://localhost:$PORT ..."
exec /Applications/Antigravity.app/Contents/MacOS/Antigravity "$DIR/server/app.js"
