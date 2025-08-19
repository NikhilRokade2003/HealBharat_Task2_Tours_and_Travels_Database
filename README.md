---

# 🏥 Hospital Database Management System (HBMS)

## 📌 Project Overview

This project is a **Hospital Database Management System** built using **MySQL**.
It is designed to manage hospital operations such as patients, doctors, appointments, treatments, departments, and billing.

The database includes:

* Table creation
* Constraints (PK, FK, CHECK, UNIQUE, NOT NULL)
* Indexes for optimization
* Sample seed data (with at least 10 records per table)
* Advanced SQL queries for demonstration

---

## 📂 Project Structure

Since everything is combined into **one script**, the structure is simple:

```
hospital_db.sql   # Complete SQL script (schema + constraints + indexes + seed data + queries)
README.md         # Documentation
```

---

## ⚙️ Setup Instructions

Follow these steps to run the database:

1. **Create Database & Use It**

   ```sql
   CREATE DATABASE hospital_db;
   USE hospital_db;
   ```

2. **Run the Script**

   ```sql
   SOURCE hospital_db.sql;
   ```

   or simply copy-paste the script into your MySQL client.

---

## 📑 Contents of `hospital_db.sql`

1. **Schema Definition (Tables)**

   * Patients
   * Doctors
   * Departments
   * Appointments
   * Treatments
   * Billing

2. **Constraints**

   * Primary keys
   * Foreign keys
   * NOT NULL, UNIQUE, CHECK constraints

3. **Indexes**

   * Optimized search queries (e.g., on `doctor_id`, `patient_id`, `appointment_date`)

4. **Seed Data**

   * 10+ sample entries for each table

5. **Sample Queries**

   * JOIN operations (e.g., list all patients with doctors)
   * Aggregations (`SUM`, `AVG`, `COUNT`)
   * GROUP BY reports (e.g., revenue per department)
   * Advanced filtering

---

## 📊 Example Queries

Some examples included in the script:

* Get all appointments with patient and doctor details
* Find total billing per patient
* Average treatment cost by department
* Upcoming appointments in the next 7 days

---

## ✅ Deliverables Checklist

✔ Schema creation
✔ Constraints added
✔ Indexes for optimization
✔ Seed data (10+ per table)
✔ Sample queries

---

## 👨‍💻 Author

* Developed by **Nikhil Rokade**
* Internship Project – Hospital Database Management System

---
