# CampusFlow — WhatsApp Bypass Academic Announcement Dashboard

> A dedicated, zero-noise academic announcement platform that replaces noisy college WhatsApp groups. Strictly focused on **verified official announcements, circulars, exam schedules, and reschedules**.

---

## 🌟 The 3 Core Engineering Pillars (From Problem Analysis)

1. **Pillar 1: Smart Filters (Stream Isolation)**
   - **Academic Directives**: Official circulars from the Dean/Controller of Examinations, exam & viva schedules, class cancellations, and room shifts.
   - **Campus Life & Clubs**: Club recruitments, fests, hackathons, and webinars are kept in a separate tab so promo flyers **never** bury official academic notices.
2. **Pillar 2: Priority Pins (Topside Shelf)**
   - Urgent notices (e.g. immediate lab/quiz room shift) are locked to a persistent, high-contrast banner at the top of the viewport with an active countdown timer.
3. **Pillar 3: Anti-Repost Engine (Deduplication)**
   - Eliminates the WhatsApp "reposting cycle" where faculty resend the same message 5 times.
   - Faculty click **"Send Reminder (Bump)"** on an existing card. The card bumps up with a reminder badge and dispatches an instant WebSocket alert without creating duplicate clutter.

---

## 🚀 Quick Start

### 1. Launch the Server
```bash
./start.sh
```
Or directly:
```bash
export ELECTRON_RUN_AS_NODE=1
/Applications/Antigravity.app/Contents/MacOS/Antigravity server/app.js
```
The server will boot on `http://localhost:3000`.

### 2. Open the Dashboard in your Browser
Navigate to:
```
http://localhost:3000
```

### 3. Demo User Accounts (Pre-seeded)
Use the 1-click **User Switcher** in the top navigation bar or log in manually:

| Role | Name | Email | Password | Details |
| :--- | :--- | :--- | :--- | :--- |
| **Faculty** | Dr. Rajesh Sharma | `dr.sharma@college.edu` | `password123` | Can publish announcements, bump reminders, and delete notices. |
| **Student 1** | Alex Kumar | `alex.student@college.edu` | `password123` | CS Dept, 3rd Year, Sec A (can view notices & mark as acknowledged). |
| **Student 2** | Riya Patel | `riya.student@college.edu` | `password123` | EE Dept, 2nd Year, Sec B. |

---

## 📡 Real-Time WebSocket Events

The app includes a built-in RFC 6455 WebSocket engine (`ws://localhost:3000/ws`):
- `TASK_CREATED`: Broadcasted when faculty publishes an announcement.
- `TASK_BUMPED`: Broadcasted when faculty clicks "Send Reminder", triggering high-priority toast alerts without cluttering the chat feed.
- `TASK_DELETED`: Broadcasted when a notice is removed.

---

## 🛠️ Tech Stack & Directory Structure

- **Server**: Node.js v24 (`node:http`, `node:sqlite`, `node:crypto`) — zero external dependencies, self-contained and fast.
- **Database**: SQLite (`campusflow.db`) with tables for `users`, `sessions`, `tasks`, and `acknowledgments`.
- **Frontend**: Responsive Single-Page Dashboard with Tailwind CSS, Lucide icons, and reactive WebSocket client.

```
whatsapp-replacement/
  ├── server/
  │   ├── app.js         # HTTP server & static file host
  │   ├── db.js          # SQLite schema & announcement data seeder
  │   ├── auth.js        # Session tokens & authentication
  │   ├── routes.js      # REST API endpoints (Auth, Announcements, Bumps, Acks)
  │   └── websocket.js   # RFC 6455 WebSocket server
  ├── public/
  │   ├── index.html     # Semantic dashboard with Priority Pin shelf & Smart Tabs
  │   ├── app.js         # Reactive frontend controller & WebSocket subscriber
  │   └── styles.css     # Styling, animations, and glow effects
  ├── start.sh           # One-click launch script
  └── README.md
```
