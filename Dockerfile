# NATS Server Docker image for Render deployment
FROM nats:2.10.7-alpine

# Install wget for health check
RUN apk add --no-cache wget

# Expose NATS ports
EXPOSE 4222 6222 8222

# Health check for Render
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD wget -q --spider http://localhost:8222/healthz || exit 1

# Run nats-server directly
CMD nats-server -DV --http 8222