# ---------- Stage 1 ----------
FROM node:20-alpine AS builder

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci --omit=dev

COPY . .

# ---------- Stage 2 ----------
FROM gcr.io/distroless/nodejs20-debian13:nonroot

WORKDIR /app

COPY --from=builder /app /app

LABEL project="roboshop" \
      service="catalogue" \
      owner="ramu"

ENV MONGO="true" \
    MONGO_URL="mongodb://mongodb:27017/catalogue"

EXPOSE 8080

CMD ["server.js"]