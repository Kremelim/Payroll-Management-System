# Payroll Management System (Oracle PL/SQL)

## 📌 Project Overview
This project is a **Payroll Management System** developed as the **COMP305 Database Management Systems Final Project**.  
It demonstrates a fully normalized (3NF) relational database design implemented using **Oracle SQL and PL/SQL**, including advanced features such as packages, triggers, sequences, dynamic reports, and data cleanup procedures.

## 📁 Project Structure

sql/
 ├── 01_tables        # Database table definitions
 ├── 02_constraints   # Primary & foreign keys
 ├── 03_sequences     # Sequences
 ├── 04_triggers      # Triggers
 ├── 05_packages      # PL/SQL packages
 └── 06_test_scripts  # Test & execution scripts

docs/
 └── ER_diagram.pdf   # ER Diagram

## 🧩 ER Diagram
The ER diagram of the database design is available in the `docs` folder.

📄 docs/ER_diagram.pdf

The system manages:
- Employees and organizational structure
- Payroll transactions and deductions
- Attendance and leave management
- Automated job history tracking
- Dynamic reporting and data integrity

---

## 🎓 Course Information
- **Course:** COMP305 – Database Management Systems  
- **Instructor:** Prof. Dr. Adem Karahoca  

### 👨‍🎓 Student: Kerem Ataç

---

## 🧱 Database Architecture

### Core Modules
- **Organization & Location**
  - REGIONS
  - COUNTRIES
  - LOCATIONS
  - DEPARTMENTS

- **Human Resources**
  - EMPLOYEES
  - JOBS
  - JOB_HISTORY
  - STATUSES

- **Time & Attendance**
  - ATTENDANCE_LOGS
  - LEAVE_TYPES
  - LEAVE_REQUESTS

- **Payroll**
  - PAYROLL_TRANSACTIONS
  - DEDUCTION_TYPES
  - EMPLOYEE_DEDUCTIONS

---

## 🔑 Key Features

### ✅ Normalized Design (3NF)
- Eliminates data redundancy
- Ensures data integrity
- Clear separation of concerns (Employees, Jobs, Departments, Locations)

### 📦 PL/SQL Packages
- **PAYROLL_ENTRY_PKG**
  - Insert regions, jobs, departments, employees
- **PAYROLL_MANAGER_PKG**
  - Update employee salary
  - Delete employees with cascade cleanup
- **PAYROLL_REPORT_PKG**
  - Dynamic employee-by-department report
  - Salary range reporting
- **DATA_CLEANUP_PKG**
  - Detects and removes duplicate employee records

### ⚙️ Automation
- Trigger (`TRG_LOG_NEW_HIRE`) automatically inserts job history on new hires
- Sequence (`JOB_HISTORY_SEQ`) for auto-generated history IDs

### 📊 Dynamic Reporting
- Department-based employee listing
- Salary range filtering
- Output via `DBMS_OUTPUT`

---

## 🛠 Technologies Used
- **Oracle SQL**
- **PL/SQL**
- Oracle Packages, Triggers, Sequences
- SQL Developer / Oracle DB

---

## 🚀 Setup & Execution

### 1️⃣ Create Tables
Run the table creation scripts in order:
```sql
REGIONS → COUNTRIES → LOCATIONS → DEPARTMENTS → JOBS → STATUSES → EMPLOYEES → ...
````

### 2️⃣ Apply Constraints

* Primary Keys
* Foreign Keys

### 3️⃣ Create PL/SQL Packages

* Entry package
* Manager package
* Reporting package
* Cleanup package

### 4️⃣ Enable Output

```sql
SET SERVEROUTPUT ON;
```

### 5️⃣ Run Test Scenarios

* Insert employees
* Update salaries
* Generate reports
* Test trigger automation
* Remove duplicates

---

## 📈 Example Reports

* Employees by department (dynamic filter)
* Employees within a salary range
* Automated job history entries
* Cleanup logs for duplicate records

---

## 🧪 Data Integrity & Safety

* Exception handling in all procedures
* Safe deletes with rollback on failure
* Foreign key–aware deletion logic

---

## 📚 Academic Purpose

This project was developed **for educational purposes** to demonstrate:

* Relational database design
* PL/SQL programming
* Normalization (3NF)
* Enterprise-style database logic

---

## 📄 License

This project is intended for **academic use only**.
