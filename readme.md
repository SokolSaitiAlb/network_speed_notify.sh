Here's a Bash script that:

1. Waits until your desktop session starts (after login).


2. Measures download/upload speed using speedtest-cli.


3. Sends a KDE Plasma notification using kdialog.




---

✅ Requirements

Make sure the following are installed:

sudo pacman -S speedtest-cli kdialog


---

📜 Script: network_speed_notify.sh

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

🔧 Make it executable

chmod +x ~/network_speed_notify.sh


---

🔁 Auto-run after login (Plasma Autostart)

1. Move the script to a safe location (e.g., ~/.config/scripts/)


2. Create a .desktop file in ~/.config/autostart/:



nano ~/.config/autostart/network_speed_notify.desktop

Paste this:

[Desktop Entry]
Type=Application
Exec=/home/your_username/.config/scripts/network_speed_notify.sh
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=Network Speed Notify
Comment=Show speedtest result on login

Replace /home/your_username/ with the actual path.


---

✅ Result

After you log in and KDE loads, you'll get a popup like:

> 📶 Network Speed:
🔁 Ping: 15.4 ms
⬇️ Download: 92.3 Mbit/s
⬆️ Upload: 34.7 Mbit/s




---

