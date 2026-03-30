FROM mysql:8.0

LABEL project="roboshop" \
      service="mysql" \
      owner="ramu"

COPY db/ /docker-entrypoint-initdb.d/

EXPOSE 3306