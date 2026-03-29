# ---------- Stage 1: Build ----------
FROM node:20-alpine AS builder

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci --omit=dev

COPY . .

# ---------- Stage 2: Runtime ----------
FROM gcr.io/distroless/nodejs20-debian13:nonroot

WORKDIR /app

LABEL project="roboshop" \
      service="user" \
      owner="ramu"

COPY --from=builder /app /app

ENV MONGO="true" \
    REDIS_URL="redis://redis:6379" \
    MONGO_URL="mongodb://mongodb:27017/users"

EXPOSE 8080

CMD ["server.js"]