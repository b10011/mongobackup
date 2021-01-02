#!/bin/bash

BACKUP_CRONRULE=${BACKUP_CRONRULE:-0 * * * *}

printenv >> /etc/environment

echo "${BACKUP_CRONRULE} /app/backup-mongodb" > /etc/cron.d/backup-mongodb
crontab /etc/cron.d/backup-mongodb

cron -f
