# Base image
FROM alpine:3.19

# Install NATS server + Python
RUN apk add --no-cache nats-server python3

# Expose ports
EXPOSE 4222 6222 8222 8080

# Start NATS + HTTP server
CMD sh -c "nats-server -DV & python3 -m http.server 8080"