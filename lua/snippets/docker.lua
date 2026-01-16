local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- ============================================================================
-- DOCKER SNIPPETS
-- ============================================================================

-- Dockerfile snippets
ls.add_snippets('dockerfile', {
  -- Alpine base with bash, curl, and neovim
  s("docker-alpine", {
    t({"FROM alpine:latest"}),
    t({"","",""}),
    t({"RUN apk add --no-cache \\"}),
    t({"    bash \\"}),
    t({"    curl \\"}),
    t({"    neovim"}),
    t({"",""}),
    t({"WORKDIR /app"}),
    t({"",""}),
    t({"CMD [\"/bin/bash\"]"}),
    i(0)
  }),

  -- Basic Dockerfile
  s("dockerfile", {
    t({"", "FROM "}), i(1, "node:18-alpine"),
    t({"",""}),
    t({"", "WORKDIR "}), i(2, "/app"),
    t({"",""}),
    t({"", "COPY package*.json ./"}),
    t({"", "RUN npm install"}),
    t({"",""}),
    t({"", "COPY . ."}),
    t({"",""}),
    t({"", "EXPOSE "}), i(3, "3000"),
    t({"",""}),
    t({"", "CMD [\"npm\", \"start\"]"}),
    t({"", ""}),
    i(0, ""), -- Final insert node
  }),

  -- Multi-stage build
  s("multistage", {
    t({"", "# Build stage"}),
    t({"", "FROM node:18-alpine AS builder"}),
    t({"", "WORKDIR /app"}),
    t({"", "COPY package*.json ./"}),
    t({"", "RUN npm ci --only=production"}),
    t({"",""}),
    t({"", "# Production stage"}),
    t({"", "FROM node:18-alpine AS production"}),
    t({"", "WORKDIR /app"}),
    t({"", "COPY --from=builder /app/node_modules ./node_modules"}),
    t({"", "COPY . ."}),
    t({"", "EXPOSE 3000"}),
    t({"CMD [\"npm\", \"start\"]",""})
  }),

  -- Python Dockerfile
  s("python", {
    t({"", "FROM python:3.11-slim"}),
    t({"",""}),
    t({"", "WORKDIR /app"}),
    t({"",""}),
    t({"", "COPY requirements.txt ."}),
    t({"", "RUN pip install --no-cache-dir -r requirements.txt"}),
    t({"",""}),
    t({"", "COPY . ."}),
    t({"",""}),
    t({"", "EXPOSE 8000"}),
    t({"",""}),
    t({"CMD [\"python\", \"app.py\"]",""})
  }),

  -- Nginx Dockerfile
  s("nginx", {
    t({"", "FROM nginx:alpine"}),
    t({"",""}),
    t({"", "COPY nginx.conf /etc/nginx/nginx.conf"}),
    t({"", "COPY dist/ /usr/share/nginx/html/"}),
    t({"",""}),
    t({"", "EXPOSE 80"}),
    t({"",""}),
    t({"CMD [\"nginx\", \"-g\", \"daemon off;\"]",""})
  }),

  -- Ubuntu base
  s("ubuntu", {
    t({"", "FROM ubuntu:22.04"}),
    t({"",""}),
    t({"", "RUN apt-get update && apt-get install -y \\"}),
    t({"", "    curl \\"}),
    t({"", "    wget \\"}),
    t({"", "    && rm -rf /var/lib/apt/lists/*"}),
    t({"",""}),
    t({"", "WORKDIR /app"}),
    t({"",""}),
    t({"", "COPY . ."}),
    t({"",""}),
    t({"CMD [\"bash\"]",""})
  }),

  -- Alpine base
  s("alpine", {
    t({"", "FROM alpine:latest"}),
    t({"",""}),
    t({"", "RUN apk add --no-cache \\"}),
    t({"", "    curl \\"}),
    t({"", "    wget \\"}),
    t({"", "    bash"}),
    t({"",""}),
    t({"", "WORKDIR /app"}),
    t({"",""}),
    t({"", "COPY . ."}),
    t({"",""}),
    t({"CMD [\"bash\"]",""})
  }),

  -- Ubuntu base (from ubuntu.lua)
  s("ubuntu_base", {
    t({
      "# Use a minimal Alpine base image",
      "FROM ubuntu:latest",
      "",
      "# Install required dependencies",
      "RUN apt-get update && apt-get install -y",
      "",
      "# Expose the default Jekyll port",
      "EXPOSE 4000",
    }),
  }),
})

-- Docker Compose snippets
ls.add_snippets('yaml', {
  -- Basic docker-compose
  s("compose", {
    t({"", "version: '3.8'"}),
    t({"",""}),
    t({"", "services:"}),
    t({"", "  app:"}),
    t({"", "    build: ."}),
    t({"", "    ports:"}),
    t({"      - \"3000:3000\"",""}),
    t({"", "    environment:"}),
    t({"", "      - NODE_ENV=production"}),
    t({"", "    depends_on:"}),
    t({"", "      - db"}),
    t({"",""}),
    t({"", "  db:"}),
    t({"", "    image: postgres:15"}),
    t({"", "    environment:"}),
    t({"", "      POSTGRES_DB: myapp"}),
    t({"", "      POSTGRES_USER: user"}),
    t({"", "      POSTGRES_PASSWORD: password"}),
    t({"", "    volumes:"}),
    t({"", "      - postgres_data:/var/lib/postgresql/data"}),
    t({"",""}),
    t({"", "volumes:"}),
    t({"", "  postgres_data:"})
  }),

  -- Web stack
  s("web-stack", {
    t({"", "version: '3.8'"}),
    t({"",""}),
    t({"", "services:"}),
    t({"", "  nginx:"}),
    t({"", "    image: nginx:alpine"}),
    t({"", "    ports:"}),
    t({"      - \"80:80\"",""}),
    t({"      - \"443:443\"",""}),
    t({"", "    volumes:"}),
    t({"", "      - ./nginx.conf:/etc/nginx/nginx.conf"}),
    t({"", "      - ./ssl:/etc/nginx/ssl"}),
    t({"", "    depends_on:"}),
    t({"", "      - app"}),
    t({"",""}),
    t({"", "  app:"}),
    t({"", "    build: ."}),
    t({"", "    environment:"}),
    t({"", "      - NODE_ENV=production"}),
    t({"", "    depends_on:"}),
    t({"", "      - db"}),
    t({"", "      - redis"}),
    t({"",""}),
    t({"", "  db:"}),
    t({"", "    image: postgres:15"}),
    t({"", "    environment:"}),
    t({"", "      POSTGRES_DB: myapp"}),
    t({"", "      POSTGRES_USER: user"}),
    t({"", "      POSTGRES_PASSWORD: password"}),
    t({"", "    volumes:"}),
    t({"", "      - postgres_data:/var/lib/postgresql/data"}),
    t({"",""}),
    t({"", "  redis:"}),
    t({"", "    image: redis:7-alpine"}),
    t({"", "    volumes:"}),
    t({"", "      - redis_data:/data"}),
    t({"",""}),
    t({"", "volumes:"}),
    t({"", "  postgres_data:"}),
    t({"", "  redis_data:"})
  }),

  -- Development environment
  s("dev-env", {
    t({"", "version: '3.8'"}),
    t({"",""}),
    t({"", "services:"}),
    t({"", "  app:"}),
    t({"", "    build:"}),
    t({"", "      context: ."}),
    t({"", "      dockerfile: Dockerfile.dev"}),
    t({"", "    ports:"}),
    t({"      - \"3000:3000\"",""}),
    t({"", "    volumes:"}),
    t({"", "      - .:/app"}),
    t({"", "      - /app/node_modules"}),
    t({"", "    environment:"}),
    t({"", "      - NODE_ENV=development"}),
    t({"", "    command: npm run dev"}),
    t({"",""}),
    t({"", "  db:"}),
    t({"", "    image: postgres:15"}),
    t({"", "    ports:"}),
    t({"      - \"5432:5432\"",""}),
    t({"", "    environment:"}),
    t({"", "      POSTGRES_DB: myapp_dev"}),
    t({"", "      POSTGRES_USER: dev"}),
    t({"", "      POSTGRES_PASSWORD: dev"}),
    t({"", "    volumes:"}),
    t({"", "      - postgres_dev_data:/var/lib/postgresql/data"}),
    t({"",""}),
    t({"", "volumes:"}),
    t({"", "  postgres_dev_data:"})
  })
})
