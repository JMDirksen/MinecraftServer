#!/bin/bash
cd "$(dirname "$0")"
[[ -f config.conf ]] && . config.conf || { echo "Config not found"; exit; }
echo $(date) Compressing files...
zip -qrFS $BACKUP_FILE . -x ".git/*"
echo $(date) Uploading archive...
scp -ql 500000 $BACKUP_FILE $BACKUP_TARGET_USERNAME@$BACKUP_TARGET_HOSTNAME:$BACKUP_TARGET_PATH
echo $(date) Backup finished
