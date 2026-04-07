FROM nginx:1.24.0-alpine3.17-slim

LABEL project="roboshop" \
      service="frontend" \
      owner="ramu"

# remove default nginx configs
RUN rm /etc/nginx/nginx.conf /etc/nginx/conf.d/default.conf

# create cache directories and set permissions
RUN mkdir -p /var/cache/nginx/client_temp && \
    mkdir -p /var/cache/nginx/proxy_temp && \
    mkdir -p /var/cache/nginx/fastcgi_temp && \
    mkdir -p /var/cache/nginx/uwsgi_temp && \
    mkdir -p /var/cache/nginx/scgi_temp && \
    chown -R nginx:nginx /var/cache/nginx && \
    chown -R nginx:nginx /etc/nginx/ && \
    chmod -R 755 /etc/nginx/ && \
    chown -R nginx:nginx /var/log/nginx

# create ssl directory
RUN mkdir -p /etc/nginx/ssl/ && \
    chown -R nginx:nginx /etc/nginx/ssl/ && \
    chmod -R 755 /etc/nginx/ssl/

# handle nginx pid file
RUN touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid /run/nginx.pid

# copy custom config and static files
COPY nginx.conf /etc/nginx/nginx.conf
COPY static /usr/share/nginx/html/

EXPOSE 80

# run as non-root nginx user
USER nginx

CMD ["nginx", "-g", "daemon off;"]