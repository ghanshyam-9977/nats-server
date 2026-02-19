# Base image with shell and python for health check
FROM alpine:3.19

# Install NATS server + Python (for fake HTTP health check)
RUN apk add --no-cache nats-server python3

# Expose NATS and fake HTTP ports
EXPOSE 4222 6222 8222 8080

# Run NATS + lightweight HTTP server (for Render health check)
CMD nats-server -DV & python3 -m http.server 8080
