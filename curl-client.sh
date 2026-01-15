#!/usr/bin/env -S bash


curl -s -N http://localhost:8080/mcp/sse > sse_output.txt &
SSE_PID=$!

sleep 1

endpoint=$(grep "data:" sse_output.txt | awk '{ print $2 }')
# echo "Endpoint: $endpoint"

curl --data '{
  "jsonrpc": "2.0",
  "id": 1,
  "method": "tools/call",
  "params": {
    "name": "calculateSum",
    "arguments": {
      "first": 42,
      "second": 42
    },
    "_meta": {
      "progressToken": 0
    }
  }
}' http://localhost:8080/$endpoint

sleep 1

kill $SSE_PID
grep data sse_output.txt 

# rm -rf sse_output.txt

echo end