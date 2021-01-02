FROM mongo:latest

RUN apt update && \
    DEBIAN_FRONTEND=noninteractive apt -y install cron

COPY ./entrypoint.sh /app/entrypoint
COPY ./backup.sh /app/backup-mongodb

RUN chmod +x /app/entrypoint /app/backup-mongodb

CMD ["/app/entrypoint"]
