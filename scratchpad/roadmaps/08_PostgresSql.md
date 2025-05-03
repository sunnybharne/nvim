# PostgreSQL Learning Plan

A structured, phase-by-phase guide to learning PostgreSQL using its official documentation and CLI tools. Great for developers who want to manage data, design schemas, and write efficient SQL for real-world applications.

---

## Resources

- [PostgreSQL Official Docs](https://www.postgresql.org/docs/)
- [PostgreSQL Tutorial](https://www.postgresqltutorial.com/)
- `psql` CLI or tools like pgAdmin, DBeaver

---

## Tips for Success

- Practice SQL daily — queries improve with repetition.
- Design real data models and normalize them.
- Use `psql`, pgAdmin, or DBeaver for hands-on database interaction.
- Post schema designs, diagrams, and queries on LinkedIn with #PostgreSQL and #BackendDev.

---

## Phase-by-Phase Learning

### Phase 1: Getting Started with PostgreSQL (Week 1)
- **Topics:**
  - Installing PostgreSQL
  - Creating databases and users
  - Connecting using `psql` or pgAdmin
- **Projects:**
  - Create your first database
  - Set up a user with permissions
  - Practice `psql` commands in terminal
- **LinkedIn Post:**
  "Just started learning PostgreSQL! Set up my first database and wrote my first query using `psql` 🎉"

---

### Phase 2: Basic SQL & Querying (Week 2)
- **Topics:**
  - SELECT, WHERE, ORDER BY, LIMIT
  - INSERT, UPDATE, DELETE
  - Aggregate functions: COUNT, SUM, AVG
- **Projects:**
  - Employee Directory
  - Expense Tracker DB
  - Query playground: run 10 custom SELECT statements
- **LinkedIn Post:**
  "Practicing SQL basics with PostgreSQL — filtering, sorting, updating, and deleting records 💡"

---

### Phase 3: Data Modeling & Schema Design (Week 3)
- **Topics:**
  - Tables, Columns, Data Types
  - Constraints: PRIMARY KEY, UNIQUE, NOT NULL
  - Normalization
- **Projects:**
  - Design a blog schema (posts, users, comments)
  - Build a normalized e-commerce schema
  - Create ERD for your capstone project
- **LinkedIn Post:**
  "Designed my first relational schema in PostgreSQL — learning about normalization and constraints 📊"

---

### Phase 4: Joins & Relationships (Week 4)
- **Topics:**
  - One-to-many, many-to-many
  - INNER JOIN, LEFT JOIN
  - Foreign keys and ON DELETE/UPDATE
- **Projects:**
  - Join blog posts with users
  - Product + Category + Reviews schema
  - Music database (artists, albums, tracks)
- **LinkedIn Post:**
  "Just built a relational music DB using joins and foreign keys in PostgreSQL 🎶"

---

### Phase 5: Indexes, Views & Optimization (Week 5)
- **Topics:**
  - CREATE INDEX
  - CREATE VIEW
  - EXPLAIN and performance tuning
- **Projects:**
  - View for latest blog posts
  - Indexed search in a product catalog
  - Analyze slow queries with EXPLAIN
- **LinkedIn Post:**
  "Learning PostgreSQL performance tricks — created indexes and views to speed up queries 🚀"

---

### Phase 6: Advanced SQL Features (Week 6)
- **Topics:**
  - Subqueries & CTEs
  - Window functions (ROW_NUMBER, RANK)
  - CASE expressions
- **Projects:**
  - Leaderboard App
  - Advanced Reports (sales, revenue per region)
  - Nested analytics dashboard queries
- **LinkedIn Post:**
  "Dove into advanced SQL in PostgreSQL — CTEs and window functions are so powerful! 💥"

---

### Phase 7: Backup, Restore, and Security (Week 7)
- **Topics:**
  - `pg_dump` and `pg_restore`
  - GRANT/REVOKE permissions
  - Database roles and access control
- **Projects:**
  - Backup/restore a sample database
  - Create user roles with limited access
  - Audit log table for sensitive changes
- **LinkedIn Post:**
  "Practicing PostgreSQL backups and permissions — protecting data like a true DBA 🔐"

---

### Phase 8: Capstone Project (Week 8)
- **Goal:** Design, build, and query a complete relational database
- **Ideas:**
  - Task manager (users, tasks, labels)
  - Blogging platform (users, posts, tags, likes)
  - Online shop (products, customers, orders, reviews)
- **LinkedIn Post:**
  "Wrapped up my PostgreSQL capstone — a full e-commerce schema with queries, constraints, and user roles. Open source and live on GitHub!"

---

## What’s Next After PostgreSQL?

- Learn ORM tools (SQLAlchemy, Django ORM, Prisma)
- Use PostgreSQL with FastAPI, Flask, or Django
- Dive into PostgreSQL internals (locking, transactions, vacuum)
- Try cloud PostgreSQL: Supabase, Neon, RDS, PlanetScale
