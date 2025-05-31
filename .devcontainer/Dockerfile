# Dockerfile
FROM node:18

# Create app directory
WORKDIR /workspace

# Optional: Install common dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    nano \
    && rm -rf /var/lib/apt/lists/*

# Default command (can be overridden in devcontainer.json or Docker Compose)
CMD [ "bash" ]
