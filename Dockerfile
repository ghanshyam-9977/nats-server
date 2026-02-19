FROM nats:latest
EXPOSE 4222 6222 8222 8080
CMD ["sh", "-c", "nats-server -DV & python3 -m http.server 8080"]
