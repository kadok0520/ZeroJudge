#!/bin/bash
set -euo pipefail

if [[ "${DB_HOST}" != "mysql_server" ]]; then
  sed -ri \
      -e "s/port=\"8080\"/port=\"80\"/g" \
      /usr/local/tomcat/conf/server.xml
  sed -ri \
      -e "s/password=\"(.*)\" removeAbandoned=/password=\"${DB_PASSWORD}\" removeAbandoned=/g" \
      -e "s/jdbc:mysql:\/\/(.*):3306/jdbc:mysql:\/\/${DB_HOST}:3306/g" \
      -e "s/connectionPassword=\"(.*)\" connection/connectionPassword=\"${DB_PASSWORD}\" connection/g" \
      /usr/local/tomcat/webapps/ROOT/META-INF/context.xml
      
  if mysqlshow --host="${DB_HOST}" --user="${DB_USER}" --password="${DB_PASSWORD}" zerojudge; then
    echo "database exist!"
  else
    echo "Creating database for You!"
    echo "CREATE DATABASE zerojudge CHARACTER SET utf8 COLLATE utf8_unicode_ci;" | mysql --host="${DB_HOST}" --user="${DB_USER}" --password="${DB_PASSWORD}"
    mysql --host="${DB_HOST}" --user="${DB_USER}" --password="${DB_PASSWORD}" zerojudge < /root/zerojudge.sql
  fi
fi

catalina.sh run
