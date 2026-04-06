# ---------- Stage 1: Build ----------
FROM node:20.20.2-alpine3.23 AS builder

WORKDIR /app

# Copy dependency files first (for caching)
COPY package.json ./

COPY *.js ./

# Install only production dependencies
RUN npm install

# ---------- Stage 2: Runtime ----------
FROM gcr.io/distroless/nodejs20-debian13:nonroot

WORKDIR /app

# Add metadata (important in real systems)
LABEL project="roboshop" \
      service="cart" \
      owner="ramu"

# Document port (internal service)
EXPOSE 8080

# Copy built app from builder
COPY --from=builder /app /app

# ENV variables removed — handled by Kubernetes ConfigMap

# Run application

CMD ["server.js"]