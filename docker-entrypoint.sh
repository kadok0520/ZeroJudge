#!/bin/sh
set -euo pipefail

mysql -h db -u ${DB_USER} -p ${DB_PASSWORD} < /root/zerojudge.sql

catalina.sh run
