#!/bin/sh
set -euo pipefail

if [[ "${DB_HOST}" != "mysql_server" ]]; then
  echo "CREATE DATABASE zerojudge CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;" | mysql --host="${DB_HOST}" --user="${DB_USER}" --password="${DB_PASSWORD}"
  mysql --host=${DB_HOST} --user=${DB_USER} --password=${DB_PASSWORD} zerojudge < /root/zerojudge.sql
fi

catalina.sh run
