# 1. System Health Monitoring Script for CPU, Memory and Disk Utilization.

#!/bin/bash

# Log file path
LOGFILE="/var/log/system_health.log"

# Threshold values
CPU_THRESHOLD=80
MEMORY_THRESHOLD=80
DISK_THRESHOLD=80
PROCESS_THRESHOLD=300

# Function to log messages
log_alert() {
    local message="$1"
    echo "$(date): $message" | tee -a "$LOGFILE"
}

# Check CPU usage
check_cpu() {
    local cpu_usage
    cpu_usage=$(mpstat 1 1 | awk '/Average:/ {print 100 - $NF}')
    if (( $(echo "$cpu_usage > $CPU_THRESHOLD" | bc -l) )); then
        log_alert "ALERT: High CPU usage detected: ${cpu_usage}%"
    fi
}

# Check memory usage
check_memory() {
    local memory_usage
    memory_usage=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100.0}')
    if (( memory_usage > MEMORY_THRESHOLD )); then
        log_alert "ALERT: High memory usage detected: ${memory_usage}%"
    fi
}

# Check disk usage
check_disk() {
    local disk_usage
    disk_usage=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')
    if (( disk_usage > DISK_THRESHOLD )); then
        log_alert "ALERT: Low disk space: ${disk_usage}% used"
    fi
}

# Check number of running processes
check_processes() {
    local process_count
    process_count=$(ps aux | wc -l)
    if (( process_count > PROCESS_THRESHOLD )); then
        log_alert "ALERT: High number of running processes: ${process_count}"
    fi
}

# Main monitoring function
monitor_system() {
    check_cpu
    check_memory
    check_disk
    check_processes
}

# Continuous monitoring loop
while true; do
    monitor_system
    sleep 60 # Run every 60 seconds
done

