# Official NATS image
FROM nats:latest

# Expose default ports
EXPOSE 4222 6222 8222

# Run NATS in verbose mode (V) with debug logs (D)
CMD ["-DV"]
