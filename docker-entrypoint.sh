#!/bin/sh
set -euo pipefail

if [[ "${DB_HOST}" != "mysql_server" ]]; then
  mysql --host=${DB_HOST} --user=${DB_USER} --password=${DB_PASSWORD} < /root/zerojudge.sql
fi

catalina.sh run
