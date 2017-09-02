#!/bin/sh
set -euo pipefail

if [[ "${DB_HOST}" != "mysql_server" ]]; then
  mysql -h db -u ${DB_USER} -p ${DB_PASSWORD} < /root/zerojudge.sql
fi

catalina.sh run
