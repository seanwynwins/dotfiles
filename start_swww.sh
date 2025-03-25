#!/bin/bash
export PATH="$HOME/swww/target/release/:$PATH"

echo "Starting swww_schedule.sh" >> /tmp/swww.log
~/swww.sh >> /tmp/swww.log 2>&1

echo "Starting swww_schedule.sh" >> /tmp/swww.log
~/swww_schedule.sh >> /tmp/swww.log 2>&1

echo "Starting swww_daemon.sh" >> /tmp/swww.log
~/swww_daemon.sh >> /tmp/swww.log 2>&1
