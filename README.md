# MongoBackup

A somewhat configurable MongoDB backup container.

## Installation

```bash
docker build -t mongobackup .
```

## Configuration

| Variable                      | Default                                | Description.                                                                                     |
| ----------------------------- | -------------------------------------- | ------------------------------------------------------------------------------------------------ |
| TZ                            |                                        | Timezone, e.g. Europe/Helsinki.                                                                  |
| BACKUP_USERNAME               |                                        | MongoDB username.                                                                                |
| BACKUP_PASSWORD               |                                        | MongoDB password.                                                                                |
| BACKUP_HOST                   |                                        | MongoDB host.                                                                                    |
| BACKUP_PORT                   | 27017                                  | MongoDB port.                                                                                    |
| BACKUP_DATABASE               |                                        | MongoDB database.                                                                                |
| BACKUP_CRONRULE               | 0 \* \* \* \*                          | Crontab rule defining interval of backing up.                                                    |
| BACKUP_NAMEFORMAT             | \${BACKUP_DATABASE}\_%Y-%m-%d-%H-%M-%S | Output directory name format, formatted using date command.                                      |
| BACKUP_DIRECTORY              | /backups                               | Directory into which backup directories will be generated.                                       |
| BACKUP_AUTHENTICATIONDATABASE | admin                                  | Database against which authentication is checked. Mongodump's 'authenticationDatabase' argument. |
