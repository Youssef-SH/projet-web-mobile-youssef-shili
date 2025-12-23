<p align="center">
  <img src="assets/isimm-clubhub-logo.PNG" alt="ISIMM ClubHub Logo" width="300">
</p>

<h1 align="center">ISIMM ClubHub</h1>

<p align="center">
  A modern platform for <strong>ISIMM clubs</strong> — built to manage events, rooms,<br>
  and keep students connected with a clean admin web app and mobile-first experience.
</p>

<hr/>

## What is this?

ISIMM ClubHub brings everything club-related into one place:

- 🗓️ A public calendar of approved events
- 🧭 Club pages with logos, bios, and updates
- 📣 Simple posting for announcements
- ✅ An approval flow so rooms & times don't clash
- 🔐 Role-based access (Student, Club, Admin)

> Mobile (Flutter) and Web Admin (Next.js) live here too — we're starting with the Backend (NestJS + PostgreSQL) so you can run the core API locally right away.

---

## Project Status

| Component | Status |
|-----------|--------|
| Backend (NestJS + TypeORM + PostgreSQL) | ✅ Ready for local use |
| Mobile (Flutter) | 🚧 Coming soon |
| Web Admin (Next.js) | 🚧 Coming soon |

---

## Tech Overview

| Layer | Technology |
|-------|------------|
| Backend | NestJS, TypeORM, PostgreSQL |
| Docs | Swagger UI auto-generated at `/api/docs` |
| Auth | JWT (access + refresh), role-based guards |
| File uploads | Multipart for CSV (invites) |
| Infra | Works locally; cloud deploy later |

---

## Folder Layout

```
isimm-clubhub/
├─ backend/           # NestJS app (this is what you'll run)
├─ mobile/            # Flutter app (coming soon)
├─ web-admin/         # Next.js admin dashboard (coming soon)
└─ docs/
   ├─ api-contract.md # REST API contract
   ├─ readme/         # product notes, specs, etc.
   └─ assets/
      └─ logo.png     # <-- replace this with the real logo
```

---

## Run the Backend Locally

> Short and sweet. You'll have a running API + Swagger in a few minutes.

### 1. Prerequisites

- Node.js 18+
- npm 9+
- PostgreSQL 13+ (locally or via Docker)

### 2. Create a database

In PostgreSQL, create a database (use any name you like):

```sql
CREATE DATABASE clubhub_db;
```

### 3. Add your environment file

Copy `.env.example` to `.env` inside `backend/` and fill in your values.

```
backend/
  .env           # <— you create this (gitignored)
  .env.example   # <— provided for reference
```

**Example (`backend/.env.example`):**

```env
# PostgreSQL
DB_HOST=localhost
DB_PORT=5432
DB_USER=postgres
DB_PASS=root
DB_NAME=clubhub_db

# Auth
JWT_SECRET=change-this
JWT_REFRESH_SECRET=change-this-too

# App
PORT=3000
```

> Your real `.env` is gitignored. Share `.env.example` with your team instead.

### 4. Install & run

```bash
cd backend
npm install
npm run start:dev
```

You should see logs like:

```
🚀 Server running on http://localhost:3000
📘 Swagger Docs available at http://localhost:3000/api/docs
```

**Open Swagger at:**  
[http://localhost:3000/api/docs](http://localhost:3000/api/docs)

---

## Tips & Troubleshooting

**Can't connect to DB?**  
Double-check `.env` values and that PostgreSQL is running. Make sure the database exists.

**Port already in use?**  
Change `PORT` in `.env` or free the port (3000 by default).

**CSV uploads not working?**  
In Swagger, use `multipart/form-data` and the field name `file` for the CSV; header must be `email`.

**Auth not working?**  
Tokens are short-lived. Use the `/auth/refresh` flow in Swagger when testing.

---

## Docs

| Resource | Location |
|----------|----------|
| **API Docs (live)** | [http://localhost:3000/api/docs](http://localhost:3000/api/docs) (Swagger UI) |
| **Contract** | `docs/api-contract.md` (human-written spec you can read like a guide) |
| **Database Schema** | `docs/db-schema.md` (tables, relationships, and constraints) |

---

## Mobile & Web

- **Mobile (Flutter):** Coming Soon
- **Web Admin (Next.js):** Coming Soon

---

## License

MIT — see the `LICENSE` file in the repo.
