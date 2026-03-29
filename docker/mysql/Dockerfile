FROM mysql:8.0

# Metadata (good practice)
LABEL project="roboshop" \
      service="mysql" \
      owner="ramu"

# Set root password
ENV MYSQL_ROOT_PASSWORD="RoboShop@1"

# Copy schema + data scripts
COPY db/ /docker-entrypoint-initdb.d/

# Expose MySQL port (internal use)
EXPOSE 3306