#!/bin/bash

BACKUP_PORT=${BACKUP_PORT:-27017}
BACKUP_DIRECTORY=${BACKUP_DIRECTORY:-/backups}
BACKUP_NAMEFORMAT=${BACKUP_NAMEFORMAT:-${BACKUP_DATABASE}_%Y-%m-%d-%H-%M-%S}
BACKUP_AUTHENTICATIONDATABASE=${BACKUP_AUTHENTICATIONDATABASE:-admin}
if [[ -z ${BACKUP_USERNAME} ]]; then exit 1; fi
if [[ -z ${BACKUP_PASSWORD} ]]; then exit 1; fi
if [[ -z ${BACKUP_HOST} ]]; then exit 1; fi
if [[ -z ${BACKUP_DATABASE} ]]; then exit 1; fi

OUTPUTDIR="${BACKUP_DIRECTORY}/$(date +${BACKUP_NAMEFORMAT})"

mkdir -p ${OUTPUTDIR}

/usr/bin/mongodump --version | tee ${OUTPUTDIR}/mongodump_version.txt

/usr/bin/mongodump \
  --username="${BACKUP_USERNAME}" \
  --password="${BACKUP_PASSWORD}" \
  --host="${BACKUP_HOST}" \
  --port="${BACKUP_PORT}" \
  --db="${BACKUP_DATABASE}" \
  --authenticationDatabase="${BACKUP_AUTHENTICATIONDATABASE}" \
  --out="${OUTPUTDIR}"
