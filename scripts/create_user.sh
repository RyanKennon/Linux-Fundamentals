#!/bin/bash

LOGFILE="/home/userryan/user_creation.log"
USERNAME=$1
GROUPNAME=$2

if [ -z "$USERNAME" ] || [ -z "$GROUPNAME" ]; then
    echo "Usage: $0 <username> <groupname>"
    exit 1
fi

if id "$USERNAME" &>/dev/null; then
    echo "$(date): User $USERNAME already exists. Skipping." | tee -a "$LOGFILE"
    exit 1
fi

sudo useradd -m "$USERNAME"
sudo usermod -aG "$GROUPNAME" "$USERNAME"

echo "$(date): Created user $USERNAME and added to group $GROUPNAME" | tee -a "$LOGFILE"
