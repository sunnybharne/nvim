# Docker Learning Plan

A step-by-step guide to learning Docker and containerization, built for developers who want to package and ship apps consistently across environments.

---

## Resources

- [Docker Docs](https://docs.docker.com/)
- [Play With Docker](https://labs.play-with-docker.com/)
- [DockerHub](https://hub.docker.com/)

---

## Tips for Success

- Think in layers (images → containers → networks).
- Practice building, tagging, pushing, and running.
- Use Docker Compose to manage multi-container projects.

---

## Phase-by-Phase Learning

### Phase 1: Docker Basics & CLI (Week 1)
- **Topics:** Images, containers, Dockerfile, volumes
- **Projects:**
  - Dockerize a Python app
  - Build and run a static HTML server
  - Run Alpine with custom shell commands
- **Post:** "Built my first Docker image! Containers make development reproducible and fast ⚙️"

---

### Phase 2: Dockerfiles & Custom Images (Week 2)
- **Topics:** Layers, caching, ENV, CMD, ENTRYPOINT
- **Projects:**
  - Custom Flask image
  - Multi-stage build for Node app
  - Docker image with private env config
- **Post:** "Practiced multi-stage Docker builds — smaller images, faster deploys 🚀"

---

### Phase 3: Docker Compose & Networking (Week 3)
- **Topics:** docker-compose, named volumes, container linking
- **Projects:**
  - Flask + PostgreSQL stack
