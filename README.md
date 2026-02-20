# NATS Server for Render

A production-ready NATS message broker Docker image optimized for Render deployment.

## Features

- Official NATS Server 2.10
- Health check endpoint enabled
- Monitoring dashboard at port 8222

## Ports

- **4222**: Client connections (main NATS port)
- **6222**: Routes for clustering
- **8222**: Monitoring/Health check endpoint

## Deploy to Render

### Option 1: Deploy from GitHub

1. Push this code to your GitHub repository
2. Go to [Render Dashboard](https://dashboard.render.com)
3. Click "New +" and select "Web Service"
4. Connect your GitHub repository
5. Configure:
   - Name: `nats-server`
   - Docker Command: Leave empty (uses Dockerfile)
   - Instance Type: Free (or paid for production)
6. Click "Create Web Service"

### Option 2: Deploy using render.yaml (Auto-Deploy)

1. Create a `render.yaml` file in your repository (already included)
2. Connect your GitHub repo to Render
3. Render will auto-detect the `render.yaml` and create the service

## Verify Deployment

After deployment, check:

- **Health Check**: `https://your-service.onrender.com/healthz`
- **Monitoring**: `https://your-service.onrender.com/` (port 8222)

## Connect to NATS

Use any NATS client to connect:

```javascript
// Example with nats.js
const nats = await connect({
  servers: ['nats://your-service.onrender.com:4222']
});
```

```go
// Example with go-nats
nc, _ := nats.Connect("nats://your-service.onrender.com:4222")
```

## Environment Variables

No additional environment variables required for basic setup.

## Local Development

```bash
# Build and run locally
docker build -t nats-server .
docker run -p 4222:4222 -p 6222:6222 -p 8222:8222 nats-server

# Test health check
curl http://localhost:8222/healthz
```

## License

MIT
