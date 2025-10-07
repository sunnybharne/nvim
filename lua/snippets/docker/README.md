# Docker Snippets

Docker containerization snippets for development and production.

## Overview

This module contains Docker snippets for containerization, including Dockerfiles, docker-compose configurations, and best practices.

## Available Snippets

### Dockerfile Patterns
- **`docker:basic`** - Basic Dockerfile template
- **`docker:multi-stage`** - Multi-stage build pattern
- **`docker:node`** - Node.js application template
- **`docker:python`** - Python application template

### Docker Compose
- **`docker:compose`** - Basic docker-compose.yml
- **`docker:compose:web`** - Web application stack
- **`docker:compose:db`** - Database service configuration

### Ubuntu/Debian
- **`docker:ubuntu`** - Ubuntu-based container setup

## Usage

1. Open a `Dockerfile` or `docker-compose.yml` file in Neovim
2. Type the snippet trigger (e.g., `docker:basic`)
3. Press `<Tab>` to expand the snippet
4. Fill in the placeholders

## Examples

### Multi-stage Dockerfile
```dockerfile
# Type 'docker:multi-stage' and press Tab
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production

FROM node:18-alpine AS runtime
WORKDIR /app
COPY --from=builder /app/node_modules ./node_modules
COPY . .
EXPOSE 3000
CMD ["npm", "start"]
```

### Docker Compose
```yaml
# Type 'docker:compose' and press Tab
version: '3.8'
services:
  app:
    build: .
    ports:
      - "3000:3000"
    environment:
      - NODE_ENV=production
    depends_on:
      - db
  
  db:
    image: postgres:15
    environment:
      - POSTGRES_DB=myapp
      - POSTGRES_USER=user
      - POSTGRES_PASSWORD=password
```

## Version

Current version: 1.0.0

## Changelog

See [CHANGELOG.md](./CHANGELOG.md) for version history.

## Contributing

When adding new snippets:
1. Follow the existing snippet authoring style guide
2. Update this README with new snippet descriptions
3. Update the changelog
4. Test snippets in Docker files
