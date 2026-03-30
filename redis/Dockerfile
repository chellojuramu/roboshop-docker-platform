FROM redis:7-alpine

# Metadata (important for real-world projects)
LABEL project="roboshop" \
      service="redis" \
      owner="ramu"

# Set working directory (optional but clean)
WORKDIR /data

# Expose Redis port (documentation only)
EXPOSE 6379

# Use default Redis server (no unnecessary config changes)
CMD ["redis-server"]