# Database Documentation

## Database Overview

Substracker uses SQLite as a local database to store user subscription information securely on the device.

---

## Database Technology

- SQLite
- Local Storage
- Offline Database

---

## Main Table

### subscriptions

Stores subscription information.

Fields:

| Field | Type | Description |
|------|------|-------------|
| id | INTEGER | Primary Key |
| name | TEXT | Subscription name |
| cost | REAL | Subscription cost |
| billingCycle | TEXT | Monthly or Yearly |
| nextBillingDate | TEXT | Next payment date |
| category | TEXT | Subscription category |

---

## Database Operations

The application supports:

- Create
- Read
- Update
- Delete

(CRUD Operations)

---

## Advantages

- Lightweight
- Fast
- Offline support
- Easy integration with Flutter