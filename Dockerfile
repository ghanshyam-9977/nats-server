# NATS Server Docker image for Render deployment
# Using official NATS image for production-ready setup
FROM nats:2.10

# Expose NATS ports
# 4222: Client connections (main NATS port)
# 6222: Routes for clustering
# 8222: Monitoring/Health check endpoint
EXPOSE 4222 6222 8222

# Health check for Render
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD wget -q --spider http://localhost:8222/healthz || exit 1

# Override entrypoint and run nats-server directly with monitoring
ENTRYPOINT []
CMD ["/opt/nats/bin/nats-server", "-DV", "--http", "8222"]