#!/bin/bash
export PATH="$HOME/swww/target/release/:$PATH"

# Define the Wayland socket path
WAYLAND_SOCKET="/run/user/1000/wayland-1"  # Adjust this path if necessary
echo "Starting script" >> /tmp/swww.log

# Wait for the Wayland socket to be created, with a timeout
while true; do
    CURRENT_TIME=$(date +%s)
    ELAPSED_TIME=$((CURRENT_TIME - START_TIME))

    if [ -S "$WAYLAND_SOCKET" ]; then
        echo "Wayland socket at $WAYLAND_SOCKET found." >> /tmp/swww.log

	echo "Starting swww_daemon.sh" >> /tmp/swww.log
	~/swww_daemon.sh >> /tmp/swww.log 2>&1 &

	echo "Starting swww.sh" >> /tmp/swww.log
	~/swww.sh >> /tmp/swww.log 2>&1

	echo "Starting swww_schedule.sh" >> /tmp/swww.log
	~/swww_schedule.sh >> /tmp/swww.log 2>&1

        exit 0  # Exit the script successfully
    elif [ "$ELAPSED_TIME" -ge "$TIMEOUT" ]; then
        echo "Timeout reached. Wayland socket at $WAYLAND_SOCKET not found." >> /tmp/swww.log
        exit 1  # Exit the script with an error code
    fi

    echo "Waiting for Wayland socket at $WAYLAND_SOCKET to be available..." >> /tmp/swww.log
    sleep 1
done

# Wait for the Wayland socket to be created, with a timeout
while true; do
    CURRENT_TIME=$(date +%s)
    ELAPSED_TIME=$((CURRENT_TIME - START_TIME))

    if [ -S "$WAYLAND_SOCKET" ]; then
        echo "Wayland socket at $WAYLAND_SOCKET found." >> /tmp/swww.log

	echo "Starting swww_daemon.sh" >> /tmp/swww.log
	~/swww_daemon.sh >> /tmp/swww.log 2>&1

	echo "Starting swww.sh" >> /tmp/swww.log
	~/swww.sh >> /tmp/swww.log 2>&1

	echo "Starting swww_schedule.sh" >> /tmp/swww.log
	~/swww_schedule.sh >> /tmp/swww.log 2>&1

        exit 0  # Exit the script successfully
    elif [ "$ELAPSED_TIME" -ge "$TIMEOUT" ]; then
        echo "Timeout reached. Wayland socket at $WAYLAND_SOCKET not found." >> /tmp/swww.log
        exit 1  # Exit the script with an error code
    fi

    echo "Waiting for Wayland socket at $WAYLAND_SOCKET to be available..." >> /tmp/swww.log
    sleep 1
done
