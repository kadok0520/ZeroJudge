#!/bin/sh
set -euo pipefail

if [[ "${DB_HOST}" != "mysql_server" ]]; then
  sed -ri \
      -e "s!password=\"(.*)\"!password=\"${DB_PASSWORD}\"!g" \
      -e "s!url=\"jdbc:mysql://(.*):3306!url=\"jdbc:mysql://${DB_HOST}:3306!g" \
      -e "s!connectionPassword=\"(.*)\"!connectionPassword=\"${DB_PASSWORD}\"!g" \
      -e "s!connectionURL=\"jdbc:mysql://(.*):3306!connectionURL=\"jdbc:mysql://${DB_HOST}:3306!g" \
      /usr/local/tomcat/webapps/ROOT/META-INF/context.xml
      
  RESULT=`mysqlshow --host=${DB_HOST} --user=${DB_USER} --password=${DB_PASSWORD} | grep zerojudge`
  if [ -z "$RESULT" ]; then
    echo "CREATE DATABASE zerojudge CHARACTER SET utf8 COLLATE utf8_unicode_ci;" | mysql --host="${DB_HOST}" --user="${DB_USER}" --password="${DB_PASSWORD}"
    mysql --host="${DB_HOST}" --user="${DB_USER}" --password="${DB_PASSWORD}" zerojudge < /root/zerojudge.sql
  fi
fi

catalina.sh run
