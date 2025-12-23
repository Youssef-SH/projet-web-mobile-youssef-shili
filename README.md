<p align="center">
  <img src="assets/isimm-clubhub-logo.PNG" alt="ISIMM ClubHub Logo" width="300">
</p>

<h1 align="center">ISIMM ClubHub</h1>

<p align="center">
  A centralized platform designed to manage and showcase student club activities within ISIMM.<br>
  It provides a single, institutional space for clubs, students, and administrators to coordinate events,<br>
  publish updates, and avoid scheduling conflicts.
</p>

<hr/>

## What is this?

ISIMM ClubHub brings everything club-related into one place:

- 🗓️ A public calendar of approved events
- 🧭 Club pages with logos, bios, and updates
- 📣 Simple posting for announcements
- ✅ An approval flow so rooms & times don't clash
- 🔐 Role-based access (Student, Club, Admin)

---

## Tech Stack

| Layer | Technology |
|-------|------------|
| Backend API | NestJS, TypeORM, PostgreSQL |
| Mobile App | Flutter |
| Web Admin | Next.js |
| Authentication | JWT (access + refresh tokens) |
| API Documentation | Swagger UI |

---

## Project Structure

```
isimm-clubhub/
├─ backend/                          # NestJS REST API
├─ mobile/                           # Flutter mobile application
├─ web-admin/                        # Next.js admin dashboard
├─ ISIMM-ClubHub-Youssef-Shili.pdf  # Project report
└─ README.md
```

---

## Key Features

**For Students:**
- Browse upcoming club events
- View club profiles and activities
- Stay updated with announcements

**For Clubs:**
- Create and manage club pages
- Submit event proposals
- Post updates and announcements

**For Administration:**
- Approve or reject event submissions
- Prevent scheduling conflicts
- Manage room allocations

---

## Backend Architecture

The backend is built with NestJS and follows a modular architecture:

- **Authentication Module** - JWT-based auth with role guards
- **Events Module** - Calendar management and conflict detection
- **Clubs Module** - Club profiles and membership
- **Publications Module** - Announcements and updates
- **Users Module** - User management with role-based access

**Database:** PostgreSQL with TypeORM ensures data integrity through constraints and relationships.

**API Documentation:** Full Swagger documentation available at `/api/docs` when running locally.

---

## Getting Started

The backend can be run locally for development and testing. Refer to the inline documentation in `backend/` for environment setup and database configuration.

---

## License

MIT â€” see the `LICENSE` file in the repo.