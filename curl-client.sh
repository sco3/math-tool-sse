#!/usr/bin/env -S bash


endpoint=$(curl -m 1 http://localhost:8080/mcp/sse 2>/dev/null | grep data: | awk '{ print $2 }')

echo $endpoint


curl --data '{
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