# Incident Response Automation Script

This script automates the process of detecting and logging SSH login failures. When run, it will analyze system logs for any suspicious SSH login activities, log its findings, and notify the incident response team if any suspicious activity is detected.

## Features

- Check system logs for SSH login failures.
- Logs analysis results with timestamps.
- Notifies the incident response team if suspicious activity is detected (you need to implement your notification method).

## Setup and Requirements

1. A Unix-based system with SSH configured.
2. Ensure that you have read access to either `/var/log/auth.log` or `/var/log/secure`, depending on your system.
3. (Optional) Configure a mail system if you plan to use email notifications.

## Usage

1. Make the script executable:

```bash
chmod +x <script_name>.sh
```

2. Run the script:

```bash
./<script_name>.sh
```

Note: Replace `<script_name>` with the actual filename of the script.

## Customization

### Notifications

By default, the notification method is commented out. If you want to use email notifications:

1. Uncomment the `send_notification()` function.
2. Update the `mail` command with appropriate email settings.
3. Ensure that the `mail` command or an equivalent mail sender is installed and configured on your system.

You can replace the email method with any other notification system you prefer, such as sending a Slack message or triggering a webhook.

## Log Directory

By default, logs are saved to `$HOME/incident_response_logs`. You can change this location by modifying the `LOG_DIR` variable.

## License

This script is open-source. Feel free to modify and distribute as you see fit.