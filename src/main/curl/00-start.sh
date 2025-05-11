#!/usr/bin/env -S bash

tmux kill-session -t sse
tmux new-session -d -s sse \
"curl -sN http://localhost:8080/mcp/sse | stdbuf -oL tee .endpoint  "

sleep 1

endpoint=$(cat .endpoint | grep data | awk '{ print $2}')

curl  -H "Content-Type: application/json" \
--data @init1.json \
http://localhost:8080/$endpoint

curl  -H "Content-Type: application/json" \
--data @init1.json \
http://localhost:8080/$endpoint



curl -H "Content-Type: application/json" --data '{
  "method": "tools/call",
  "params": {
    "name": "getSum",
    "arguments": {
      "a": 42,
      "b": 42
    },
    "_meta": {
      "progressToken": 0
    }
  }
}' http://localhost:8080/$endpoint