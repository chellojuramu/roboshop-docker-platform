# ---------- Stage 1 ----------
FROM python:3.9-alpine AS builder

WORKDIR /build

RUN apk add --no-cache build-base linux-headers pcre-dev

COPY requirements.txt .
RUN pip install --prefix=/install -r requirements.txt

COPY . .

# ---------- Stage 2 ----------
FROM python:3.9-alpine

WORKDIR /app

# Install runtime dependency
RUN apk add --no-cache pcre

# Copy dependencies
COPY --from=builder /install /usr/local

# Copy app
COPY payment.ini *.py ./

ENV CART_HOST="cart" \
    CART_PORT="8080" \
    USER_HOST="user" \
    USER_PORT="8080" \
    AMQP_HOST="rabbitmq" \
    AMQP_USER="roboshop" \
    AMQP_PASS="roboshop123"

EXPOSE 8080

CMD ["uwsgi", "--ini", "payment.ini"]