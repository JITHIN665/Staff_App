#!/bin/bash
echo "🌐 Starting JSON Server on port 3000..."
echo "🌍 Server will be accessible from emulator/device via your network IP"
npx json-server --watch db.json --port 3000 --host 0.0.0.0
