# Stage 1: build (not required for plain static files, kept for pattern)
FROM alpine:3.18 AS builder
WORKDIR /app
COPY . /app

# Stage 2: nginx to serve static content
FROM nginx:1.25-alpine
# Remove default site and copy our files
RUN rm -rf /usr/share/nginx/html/*
COPY index.html /usr/share/nginx/html/
COPY style.css /usr/share/nginx/html/
COPY script.js /usr/share/nginx/html/
# optional custom nginx config (to serve index.html for all requests)
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
