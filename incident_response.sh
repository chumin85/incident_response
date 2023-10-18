#!/bin/bash

# Define variables for directories and log files
LOG_DIR="$HOME/incident_response_logs"
LOG_FILE="$LOG_DIR/$(date +'%Y-%m-%d_%H-%M-%S')-incident.log"

# Ensure log directory exists
mkdir -p "$LOG_DIR"

# Initialize the log file
echo "Incident Response Automation started at $(date)" >> "$LOG_FILE"

# Function for SSH login failure detection and response
perform_ssh_detection() {
  # Analyze SSH authentication logs for failed login attempts
  if [ -f "/var/log/auth.log" ]; then
    suspicious_entries=$(grep "Failed password" /var/log/auth.log)
  elif [ -f "/var/log/secure" ]; then
    suspicious_entries=$(grep "Failed password" /var/log/secure)
  else
    echo "No suspicious SSH login activity found. No further action needed." >> "$LOG_FILE"
    return
  fi

  # Log the analysis results
  echo "SSH login failure analysis started at $(date)" >> "$LOG_FILE"
  echo "$suspicious_entries" >> "$LOG_FILE"
  echo "SSH login failure analysis completed at $(date)" >> "$LOG_FILE"

  # Check if suspicious activity was found
  if [ -n "$suspicious_entries" ]; then
    echo "Suspicious SSH login activity detected. Investigate further." >> "$LOG_FILE"

    # Notify the incident response team (replace with your notification method)
    send_notification "Suspicious SSH login activity detected. Please investigate."
  else
    echo "No suspicious SSH login activity found. No further action needed." >> "$LOG_FILE"
  fi
 }

# Function to send notifications (replace with your notification method)
# send_notification() {
#  echo "$1" | mail -s "Incident Alert" admin@example.com
# }

# Main execution
perform_ssh_detection

echo "Incident Response Automation completed at $(date)" >> "$LOG_FILE"