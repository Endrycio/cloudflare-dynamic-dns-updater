# Cloudflare Dynamic DNS A RECORD Updater (Windows .bat Script)

This is a lightweight, single-file `.bat` script that automatically updates a specific A record on your Cloudflare DNS with your current public IP address. Perfect for users with a dynamic IP from their ISP and selfhosted servers.

---

## Features

- Retrieves your public IPv4 via [ipify.org](https://api.ipify.org)
- Updates a specific DNS Address record in your Cloudflare zone
- Adds a custom comment with timestamp to the A record
- Adjust TTL
- Can be (and should be) scheduled via Windows Task Scheduler

---

## Requirements

- Windows
- ZoneID
- RecordID
- DNS API Token

---

## Configuration

Open the `update-dns.bat` file and set the following variables:

```bat
set "zoneId=YOUR_ZONE_ID"
set "recordId=YOUR_RECORD_ID"
set "apiToken=YOUR_API_TOKEN"
set "recordName=YOUR_RECORD_NAME" :: @ for root
```

---

## Schedule via Task Scheduler

1. Open Task Scheduler > Create Basic Task
2. Trigger: Weekly > Repeat every 7 days or whenever you get a new public IP
3. Action: Start a program > Browse to your `.bat` script
4. Check: "Run with the least privileges"

---

## Unlicensed

Feel free to use, fork, modify or build upon this script.
