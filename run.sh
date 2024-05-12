#!/bin/bash

# Find the PID listening on port 3000
PID=$(ss -tulpn | grep ':3000' | awk '{print $NF}' | cut -d '=' -f 2)

if [ -n "$PID" ]; then
    echo "Process with PID $PID found running on port 3000. Killing..."
    kill $PID
else
    echo "No process found running on port 3000."
fi

nohup serve -s . > /dev/null 2>&1 &