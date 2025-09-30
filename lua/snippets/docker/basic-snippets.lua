local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

-- Import common utilities
local utils = require("snippets.utils")
local fn = utils.fn
local generate_container_name = utils.generate_container_name
local generate_port = utils.generate_port
local generate_env_var = utils.generate_env_var

-- Docker basic snippets
ls.add_snippets('dockerfile', {
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
  })
})
