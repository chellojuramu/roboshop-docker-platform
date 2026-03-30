FROM nginx:1.24.0-alpine

# Remove default content and configs (single layer)
RUN rm -rf /usr/share/nginx/html/* \
    /etc/nginx/nginx.conf \
    /etc/nginx/conf.d/*

# Add metadata (important for production)
LABEL project="roboshop" \
      service="frontend" \
      owner="ramu"

# Copy custom nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Copy static frontend files
COPY static/ /usr/share/nginx/html/

# Ensure correct permissions (optional but good practice)
RUN chmod -R 755 /usr/share/nginx/html

# Expose HTTP port
EXPOSE 80

# Run nginx in foreground
CMD ["nginx", "-g", "daemon off;"]