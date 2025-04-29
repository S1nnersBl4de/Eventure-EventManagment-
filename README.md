# 🎟️ Eventure - Event Management System

A full-stack event management system where users can view events, purchase tickets, and receive confirmation emails with QR codes.

---

##  Features

- View list of upcoming events with full details
- Purchase tickets with email confirmation and QR code
- Admin dashboard access for special accounts
- SQL Server database integration
- State management using Angular services and observables
- Fully responsive design with red and white theme

---

## 📂 Project Structure

```plaintext
/EventureProject
├── backend/   → ASP.NET Core Web API (C#)
├── frontend/  → Angular Application (TypeScript)
└── README.md  → Project documentation

⚙️ Backend Setup (ASP.NET Core)

Navigate to the backend/ folder: cd EventManagment
Restore the packages: dotnet restore
Update the database if needed: dotnet ef database update
Run the backend server: dotnet run
📍 The backend API will be available at:
https://localhost:7096



🖥️ Frontend Setup (Angular)

Navigate to the frontend/ folder: cd Event-Managment
Install Angular dependencies: npm install
Start the Angular development server: ng serve
📍 The frontend will be available at:
http://localhost:4200


🛢️ Database Setup (SQL Server)

Go to the script: /backend/sql-scripts/initial-database.sql

Open SQL Server Management Studio (SSMS) or Visual Studio SQL Explorer

Create a new database named: EventManagment

Run the script to create all necessary tables and data



🔐 Admin Login Credentials
Use this account to log into the Admin Dashboard:

Email: lashatinikashvili29@gmail.com

Password: Admin_321

This user has full access to dashboard features and analytics.



📬 Contact
For any questions, support, or collaboration, contact:

📧 lashatinikashvili29@gmail.com

---------------------------------------------------------------------------------------