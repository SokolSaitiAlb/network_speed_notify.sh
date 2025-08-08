#!/bin/bash

# Wait until the KDE session is ready
sleep 20  # optional: adjust for slow boot

# Run speedtest and capture results
result=$(speedtest-cli --simple)

# Extract Ping, Download, and Upload
ping=$(echo "$result" | grep "Ping" | awk '{print $2, $3}')
download=$(echo "$result" | grep "Download" | awk '{print $2, $3}')
upload=$(echo "$result" | grep "Upload" | awk '{print $2, $3}')

# Prepare message
message="📶 Network Speed:\n🔁 Ping: $ping\n⬇️ Download: $download\n⬆️ Upload: $upload"

# Show KDE Plasma notification
kdialog --title "Network Speed Report" --passivepopup "$message" 10


---
