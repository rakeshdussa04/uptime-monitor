#!/bin/bash

echo "Starting Self-Healing Monitor..."

while true
do
    # Check the server status
    code=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8000)

    if [ "$code" -eq 200 ]; then
        echo "✅ [$(date +%T)] Server is UP!"
    else
        echo "⚠️  [$(date +%T)] Server is DOWN. Attempting restart..."
        
        # --- THE FIX ---
        # 1. We run the start command
        # 2. "> /dev/null 2>&1" silences the output so it doesn't clutter your screen
        # 3. "&" puts it in the background
        python3 -m http.server 8000 > /dev/null 2>&1 &
        
        # Wait a moment for the server to boot up
        sleep 1
        echo "🔧 [$(date +%T)] Restart command sent."
    fi

    sleep 2
done
