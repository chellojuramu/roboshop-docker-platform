# ---------- Stage 1 ----------
FROM python:3.9.25-alpine3.22 AS builder

WORKDIR /app

RUN apk add --no-cache build-base linux-headers pcre-dev

COPY requirements.txt .
RUN pip3.9 install --prefix=/install -r requirements.txt

# ---------- Stage 2 ----------
FROM python:3.9.25-alpine3.22

WORKDIR /app

LABEL project="roboshop" \
      service="payment" \
      owner="ramu"

EXPOSE 8080

RUN apk add --no-cache pcre

RUN addgroup -S roboshop && adduser -S roboshop -G roboshop && \
    chown -R roboshop:roboshop /app

COPY --from=builder /install /usr/local

COPY --chown=roboshop:roboshop payment.ini *.py requirements.txt .

# ENV removed — handled by Kubernetes ConfigMap

USER roboshop

CMD ["uwsgi", "--ini", "payment.ini"]