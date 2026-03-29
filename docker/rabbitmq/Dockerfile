FROM rabbitmq:3.13-management-alpine

# Metadata
LABEL project="roboshop" \
      service="rabbitmq" \
      owner="ramu"

# Set default user credentials
ENV RABBITMQ_DEFAULT_USER=roboshop \
    RABBITMQ_DEFAULT_PASS=roboshop123

# Expose ports
EXPOSE 5672   # application communication
EXPOSE 15672  # management UI

# Default entrypoint will start RabbitMQ