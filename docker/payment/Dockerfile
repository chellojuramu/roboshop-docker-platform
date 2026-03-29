# ---------- Stage 1: Build ----------
FROM python:3.9-alpine AS builder

WORKDIR /build

# Install build dependencies
RUN apk add --no-cache \
    build-base \
    linux-headers \
    pcre-dev

# Copy dependency file first (for caching)
COPY requirements.txt .

# Install dependencies into custom location
RUN pip install --prefix=/install -r requirements.txt


# ---------- Stage 2: Runtime ----------
FROM gcr.io/distroless/python3-debian12

WORKDIR /app

# Metadata
LABEL project="roboshop" \
      service="payment" \
      owner="ramu"

# Copy installed dependencies
COPY --from=builder /install /usr/local

# Copy application code
COPY payment.ini *.py ./

# Environment variables
ENV CART_HOST="cart" \
    CART_PORT="8080" \
    USER_HOST="user" \
    USER_PORT="8080" \
    AMQP_HOST="rabbitmq" \
    AMQP_USER="roboshop" \
    AMQP_PASS="roboshop123"

# Internal port
EXPOSE 8080

# Run application
CMD ["uwsgi", "--ini", "payment.ini"]