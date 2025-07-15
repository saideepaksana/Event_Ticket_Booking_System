# TIXORA – Event Ticket Booking System

**TIXORA** is a web‑based event ticket booking application that lets users browse upcoming events, select seats, and manage their bookings—all in one place.

---

## Table of Contents

- [About](#about)  
- [Features](#features)  
- [Project Structure](#project-structure)  
- [Getting Started](#getting-started)  
- [Database Setup](#database-setup)  
- [Contributing](#contributing)  
- [License](#license)  

---

## About

TIXORA provides a streamlined interface for discovering, booking, and reviewing event tickets. Built with plain HTML, CSS, and JavaScript on the front end, and Node.js + Express on the back end, it leverages SQL scripts to define and seed the database.

---

## Features

- **Event Discovery**  
  Browse a catalog of events with images, dates, locations, and descriptions.  
- **Secure Booking Flow**  
  Select ticket tiers (Silver, Gold, Platinum), enter details, and confirm purchases.  
- **User Authentication**  
  Sign up and log in to view past transactions and manage upcoming bookings.  
- **Transaction Summary**  
  Display booking confirmations with booking IDs, transaction timestamps, and totals.  
- **Responsive Design**  
  Mobile‑friendly layout adapts to smartphones, tablets, and desktops.  

---

## Project Structure

```text
TIXORA/
├── assets/ # images, icons, fonts
│ └── images/
│ ├── slideshow1.png
│ ├── slideshow2.png
│ └── …
├── database/ # SQL schemas & sample data
│ ├── schema.sql
│ └── fst.sql
├── docs/ # design docs & reports
│ ├── Problem_Statement.pdf
│ └── DBMS_TIXORA_Project_Report.pdf
├── src/ # front‑end source files
│ ├── css/
│ │ └── style.css
│ ├── html/
│ │ ├── index.html
│ │ ├── events.html
│ │ ├── eventdetails.html
│ │ ├── book.html
│ │ ├── transaction.html
│ │ ├── login.html
│ │ ├── signup.html
│ │ ├── user.html
│ │ └── about.html
│ └── js/
│ ├── index.js
│ ├── event.js
│ ├── catev.js
│ ├── book.js
│ ├── ticket.js
│ ├── db.js
│ └── userinfo.js
├── server/ # back‑end (Node.js + Express)
│ ├── app.js
│ └── route.js
├── README.md # this file
└── package.json # project metadata & dependencies
```text


---

## Getting Started

1. **Clone the repository**  
   ```bash
   git clone https://github.com/saideepaksana/Event_Ticket_Booking_System.git
   cd Event_Ticket_Booking_System
    ```bash

2. ** Install dependencies **
```bash
npm install
```bash

3. ** Start the server **
```bash
npm start
```bash


##Database Setup
1. Create your database (e.g., in MySQL or PostgreSQL).

2. Import schema
```bash
mysql -u <username> -p <dbname> < database/schema.sql
```bash

3. Seed sample data (optional)
```bash
mysql -u <username> -p <dbname> < database/fst.sql
```bash

4. Configure credentials in src/js/db.js (or a .env file if you extend).

## Contributing
1. Fork this repo

2. Create a feature branch: git checkout -b feature/YourFeature

3. Commit your changes: git commit -m "Add your feature"

4. Push to your branch: git push origin feature/YourFeature

5. Open a Pull Request

Please adhere to code style conventions and include tests where appropriate.

## License
This project is licensed under the MIT License.
Feel free to use, modify, and distribute as you see fit.
```bash

```bash