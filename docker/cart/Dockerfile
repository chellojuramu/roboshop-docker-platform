# ---------- Stage 1: Build ----------
FROM node:20-alpine AS builder

WORKDIR /app

# Copy dependency files first (for caching)
COPY package.json package-lock.json ./

# Install only production dependencies
RUN npm ci --omit=dev

# Copy application code
COPY . .

# ---------- Stage 2: Runtime ----------
FROM gcr.io/distroless/nodejs20-debian13:nonroot

WORKDIR /app

# Add metadata (important in real systems)
LABEL project="roboshop" \
      service="cart" \
      owner="ramu"

# Copy built app from builder
COPY --from=builder /app /app

# Environment variables for service communication
ENV REDIS_HOST="redis" \
    CATALOGUE_HOST="catalogue" \
    CATALOGUE_PORT="8080"

# Document port (internal service)
EXPOSE 8080

# Run application
CMD ["server.js"]