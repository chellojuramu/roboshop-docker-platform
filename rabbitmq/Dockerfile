FROM rabbitmq:3.13-management-alpine

LABEL project="roboshop" \
      service="rabbitmq" \
      owner="ramu"

ENV RABBITMQ_DEFAULT_USER=roboshop \
    RABBITMQ_DEFAULT_PASS=roboshop123

# application communication
EXPOSE 5672

# management UI
EXPOSE 15672