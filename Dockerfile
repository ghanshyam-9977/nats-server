# -------------------------------------------
#  Render NATS Server Setup
# -------------------------------------------

# Use official NATS image
FROM nats:latest

# Expose default ports for clients, routes, and monitoring
EXPOSE 4222 6222 8222

# Start the NATS server in verbose mode
CMD ["nats-server", "-DV"]
